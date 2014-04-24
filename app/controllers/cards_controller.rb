class CardsController < ApplicationController
  respond_to :html, :js

  def new
    @deck = find_deck
    @image_search = ImageSearch.new
  end

  def create
    deck = find_deck
    deck.cards.create(card_params)
    @location = next_location_for(deck)
  end

  def index
    @deck = find_deck
    @cards = @deck.cards.shuffle
    if @cards.empty?
      flash[:notice] = 'Deck is empty! Add Cards before studying'
      redirect_to @deck
    end
  end

  def edit
    @card = find_card
  end

  def update
    @card = find_card
    @card.update(card_params)
  end

  def destroy
    @card = find_card
    @card.destroy
  end

  private

  def card_params
    params.require(:card).permit(:front, :back, :image_url)
  end

  def find_card
    Card.find(params[:id])
  end

  def finished?
    params[:commit] == 'Finished'
  end

  def next_location_for(deck)
    if finished?
      deck_path(deck)
    else
      new_deck_card_path(deck)
    end
  end
end
