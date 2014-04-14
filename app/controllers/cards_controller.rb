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
    @cards = deck.cards.order('RANDOM()')
  end

  private
 
  def find_deck
    current_user.decks.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:front, :back, :image_url)
  end

  def finished?
    params[:commit] == 'Finished'
  end
end
