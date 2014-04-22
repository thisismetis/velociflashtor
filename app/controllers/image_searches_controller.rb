class ImageSearchesController < ApplicationController

  def create
    @images = GoogleSearch.new(image_search_params).images
    @deck = find_deck
    @card = @deck.cards.new(card_params)
  end

  private

  def image_search_params
    params[:image_search][:front]
  end

  def card_params
    params.require(:image_search).permit(:front, :back)
  end
end
