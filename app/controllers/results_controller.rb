class ResultsController < ApplicationController

  def index
    @deck = find_deck
    @guess_bank = guess_bank
  end

  def show
    @guess_bank = params[:guess_bank]
    @deck = Deck.find(params[:id])
  end

  private

  def find_deck
    Deck.find(params[:guess][:deck_id])
  end

  def guess_bank
    params[:guess][:guess_bank]
  end
end
