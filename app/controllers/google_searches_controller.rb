class GoogleSearchesController < ApplicationController
  respond_to :js

  def create
    @card = find_card
    @images = GoogleSearch.new(@card.front).images
    respond_with 'cards/add_images'
  end

  private

  def valid_image_search?
    @card.front != ''
  end
end
