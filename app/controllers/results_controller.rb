class ResultsController < ApplicationController
  respond_to :json

  def show
    @deck = find_deck
    @results = guess_bank.map do |card_id, guesses|
      card = Card.find(card_id)
      result = Result.new(card, guesses)
    end
    @recommend = find_recommend(@deck)
  end

  private

  def guess_bank
    params[:guess_bank]
  end

  def find_recommend(deck)
    if signed_in?
      current_user.recommends.find_by(deck: deck)
    end
  end
end
