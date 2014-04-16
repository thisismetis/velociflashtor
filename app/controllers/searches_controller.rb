class SearchesController < ApplicationController

  def show
    @query = params[:search][:query]
    @decks = find_decks
  end

  private

  def find_decks
    deck_searcher = DeckSearcher.new(params[:search][:query])
    deck_searcher.decks
  end

end
