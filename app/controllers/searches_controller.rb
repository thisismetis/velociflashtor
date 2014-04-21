class SearchesController < ApplicationController

  def show
    @query = query_params
    @decks = find_decks
    @cards = find_cards
  end

  private

  def query_params
    params[:search][:query]
  end

  def find_decks
    deck_searcher = DeckSearcher.new(query_params)
    deck_searcher.decks
  end

  def find_cards
    card_searcher = CardSearcher.new(query_params)
    card_searcher.cards
  end

end
