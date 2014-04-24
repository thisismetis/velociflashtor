class TestsController < ApplicationController
  def show
    @deck = find_deck
    if @deck.cards.empty?
      flash[:notice] = 'Deck is empty! Add Cards before Quizzing'
      redirect_to @deck
    else
      @card_ids = @deck.cards.ids.shuffle
      @card = Card.find(@card_ids.first)
      @card.increment!(:num_attempts)
      @card_last_id = @card_ids.last
    end
  end
end
