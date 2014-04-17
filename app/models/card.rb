class Card < ActiveRecord::Base
  belongs_to :deck

  def update_guess_metrics(guess_result)
    increment!(:num_guesses)
    if guess_result
      increment!(:num_correct)
    end
  end

  def update_attempts
    increment!(:num_attempts)
  end

end
