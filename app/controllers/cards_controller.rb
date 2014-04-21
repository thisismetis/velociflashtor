class CardsController < ApplicationController
  respond_to :html, :js

  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create
    @deck = find_deck
    @card = @deck.cards.new(card_params)
    add_images_to_form
    persist_new_card
    @location = next_location_for(@deck)
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

  def add_images_to_form
    if add_images?
      if valid_image_search?
        @images = GoogleSearch.new(@card.front).images
        render 'cards/add_images'
      else
        flash[:notice] = 'Front cannot be empty'
      end
    end
  end

  def add_images?
    params[:commit] == 'Add Images'
  end

  def valid_image_search?
    @card.front != ''
  end

  def persist_new_card
    if !finished?
      if @card.save
        flash[:notice] = 'Card Created Successfully'
      else
        flash[:notice] = 'Invalid Inputs'
      end
    end
  end

  def finished?
    params[:commit] == 'Finished'
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
