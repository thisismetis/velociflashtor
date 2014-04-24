class GuessesController < ApplicationController
  def new
    @card = find_next_card
    @card.increment!(:num_attempts)
  end

  private

  def find_next_card
    card_id = params[:guess][:next_card]
    Card.find(card_id)
  end
end
