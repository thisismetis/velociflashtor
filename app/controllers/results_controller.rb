class ResultsController < ApplicationController
  respond_to :json

  def index
    @card_ids = card_ids
    @deck = find_deck
    @guess_bank = guess_bank
  end

  def show
    @guess_bank = guess_bank
    @deck = Deck.find(params[:id])
    @like = Like.find_by(deck: @deck)
  end

  private

  def find_deck
    Deck.find(params[:deck_id])
  end

  def guess_bank
    guess_hash = params[:guess_bank].dup
    guess_hash.inject({}) { |h, (k, v)| h[k.to_i] = v; h }
  end

  def card_ids
    string_array = params[:card_ids]
    string_array.map(&:to_i)
  end
end
