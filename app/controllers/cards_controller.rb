class CardsController < ApplicationController
  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create

    if add_images?
      @images = GoogleSearch.new(image_search_params).images
      render :new
    else
      deck = find_deck
      deck.cards.create(card_params)
      @location = next_location_for(deck)
    end
  end

  def index
    @deck = find_deck
    @cards = @deck.cards.shuffle
  end

  private

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

  def next_location_for(deck)
    if finished?
      deck_path(deck)
    else
      new_deck_card_path(deck)
    end
  end
end
