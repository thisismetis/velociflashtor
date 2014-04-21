class CardsController < ApplicationController
  respond_to :html, :js

  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create
    @deck = find_deck
    @card = @deck.cards.new(card_params)
    if add_images?
      add_images_to_form
    else
      persist_new_card
      @location = next_location_for(@deck)
    end
  end

  def index
    @deck = find_deck
    @cards = @deck.cards.shuffle
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

  def add_images?
    params[:add_images]
  end

  def add_images_to_form
    image_search = GoogleSearch.new(@card.front)
    if image_search.valid?
      @images = image_search.images
      render 'cards/add_images'
    else
      render 'errors/empty_front'
    end
  end

  def valid_image_search?
    @card.front != ''
  end

  def persist_new_card
    if @card.save
      flash[:notice] = 'Card Created Successfully'
    else
      flash[:notice] = 'Invalid Inputs'
    end
  end

  def finished?
    params[:finished]
  end

  def find_card
    Card.find(params[:id])
  end

  def next_location_for(deck)
    if finished?
      deck_path(deck)
    else
      new_deck_card_path(deck)
    end
  end
end
