class TestsController < ApplicationController
  def show
    @deck = find_deck
    @card_ids = @deck.cards.ids.shuffle
    @card = Card.find(@card_ids.first)
    @num_guesses = 0
  end

  def create
    @num_guesses = num_guesses
    @card = find_card
    if @card.check_guess(guess)
      render :correct_guess
    elsif @num_guesses == 3
      render :max_guesses
    else
      render :incorrect_guess
    end

  end

  private

  def guess
    params[:test][:guess]
  end

  def find_card
    card_id = params[:test][:card_id].to_i
    Card.find(card_id)
  end

  def num_guesses
    params[:test][:num_guesses].to_i + 1
  end

end
