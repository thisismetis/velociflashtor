class TestsController < ApplicationController
  def show
    @deck = find_deck
    @card_ids = @deck.cards.ids.shuffle
    @card = Card.find(@card_ids.first)
    @num_guesses = 0
  end

end
