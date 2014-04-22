class GuessCheckersController < ApplicationController
  def create
    @card = find_card
    guess_checker = GuessChecker.new(user: current_user, card: @card)
    @guess_result = guess_checker.correct_guess?(guess)
    guess_checker.update_guess_metrics(@guess_result)
  end

  private

  def guess
    params[:guess][:guess]
  end
end
