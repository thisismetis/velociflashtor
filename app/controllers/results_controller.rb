class ResultsController < ApplicationController
  respond_to :json

  def show
    @like = Like.find_by(deck: @deck)
    @deck = find_deck
    @results = []
    guess_bank.each do |card_id, guesses|
      card = Card.find(card_id)
      result = Result.new(card, guesses)
      @results << result
    end
  end

  private

  def guess_bank
    guess_hash = params[:guess_bank].dup
    guess_hash.inject({}) { |h, (k, v)| h[k.to_i] = v; h }
  end

end
