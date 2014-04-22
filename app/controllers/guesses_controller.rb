class GuessesController < ApplicationController
  def show
    @num_guesses = num_guesses.to_i + 1
    @card = find_current_card
    guess_checker = GuessChecker.new(user: current_user, card: @card)
    guess_result = guess_checker.correct_guess?(guess)
    guess_checker.update_guess_metrics(guess_result)
    guess_location(guess_result, @num_guesses)
  end

  def create
    current_card = find_current_card
    @last_card = params[:guess][:last_card]
    GuessChecker.new(user:current_user, card: current_card).update_attempts
    @card = find_next_card
  end

  private

  def guess
    params[:guess][:guess]
  end

  def find_current_card
    card_id = params[:guess][:current_card]
    Card.find(card_id)
  end

  def find_next_card
    card_id = params[:guess][:next_card]
    if card_id == ''
      deck_id = params[:guess][:deck_id]
      @deck = Deck.find(deck_id)
      @guess_bank = params[:guess][:guess_bank]
      render :end_of_deck
    else
      Card.find(card_id)
    end
  end

  def num_guesses
    params[:guess][:num_guesses]
  end

  def last_card?
    last_card = params[:guess][:last_card]
    current_card = params[:guess][:current_card]
    last_card == current_card
  end

  def guess_location(guess_result, num_guesses_made, max_guesses = 3)
    @last_card = last_card?
    if guess_result
      render :correct_guess
    elsif num_guesses_made == max_guesses
      render :max_guesses
    else
      render :incorrect_guess
    end
  end
end
