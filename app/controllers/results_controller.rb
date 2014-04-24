class ResultsController < ApplicationController
  respond_to :json

  def show
    @deck = find_deck
    @like = Like.find_by(deck: @deck)
    @results = guess_bank.map do |card_id, guesses|
      card = Card.find(card_id)
      result = Result.new(card, guesses)
    end
  end

  private

  def guess_bank
    params[:guess_bank]
  end

end
