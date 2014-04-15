class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @decks = @tag.decks(deck: [:user])
  end
end
