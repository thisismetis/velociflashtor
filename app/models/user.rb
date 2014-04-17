class User < ActiveRecord::Base
  include Clearance::User

  has_many :decks, dependent: :destroy

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
