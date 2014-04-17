class GuessesController < ApplicationController
  def show
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

  def create
    @card = find_card
    @num_guesses = 0
  end

  private

  def guess
    params[:guess][:guess]
  end

  def find_card
    card_id = params[:guess][:card_id].to_i
    Card.find(card_id)
  end

  def num_guesses
    params[:guess][:num_guesses].to_i + 1
  end

end
