class CardsController < ApplicationController
  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create
    deck = find_deck
    deck.cards.create(card_params)
    if finished?
      redirect_to deck_path(deck)
    else
      redirect_to new_deck_card_path(deck)
    end
  end

  def index
    deck = find_deck
    @cards = deck.get_cards
  end

  private
  def find_deck
    Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:front, :back, :image_url)
  end

  def finished?
    if params[:commit] == "Finished"
      true
    else
      false
    end
  end
end
