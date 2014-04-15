class CardsController < ApplicationController
  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create

    if add_images?
      @images = GoogleSearch.google_search(image_search_params)
      render :new
    else
      deck = find_deck
      deck.cards.create(card_params)

      if finished?
        @location = deck_path(deck)
      else
        @location = new_deck_card_path(deck)
      end
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

  def add_images?
    params[:commit] == 'Add Images'
  end

  def image_search_params
    params[:card][:front]
  end
end
