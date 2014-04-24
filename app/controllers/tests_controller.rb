class TestsController < ApplicationController
  def show
    @deck = find_deck
    @card_ids = @deck.cards.ids.shuffle
    @card = Card.find(@card_ids.first)
    @card.increment!(:num_attempts)
    @card_last_id = @card_ids.last
  end
end
