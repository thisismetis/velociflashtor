class GuessesController < ApplicationController
  def show
    @num_guesses = num_guesses
    @card = find_card
    guess_checker = GuessChecker.new(card: @card, guess: guess)
    guess_result = guess_checker.correct_guess?
    guess_location(guess_result, @num_guesses)
  end

  def create
    @card = find_card
  end

  private

  def guess
    params[:guess][:guess]
  end

  def find_card
    card_id = params[:guess][:card_id].to_i
    if card_id == 0
      deck_id = params[:guess][:deck_id].to_i
      @deck = Deck.find(deck_id)
      render :end_of_deck
    else
      Card.find(card_id)
    end
  end

  def num_guesses
    params[:guess][:num_guesses].to_i + 1
  end

  def guess_location(guess_result, num_guesses_made, max_guesses = 3)
    if guess_result
      render :correct_guess
    elsif num_guesses_made == max_guesses
      render :max_guesses
    else
      render :incorrect_guess
    end
  end
end
