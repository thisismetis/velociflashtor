class TagsController < ApplicationController

  def show
    @tag = find_tag
    @decks = @tag.decks(deck: [:user])
  end

  private

  def find_tag
    Tag.find(params[:id])
  end

end
