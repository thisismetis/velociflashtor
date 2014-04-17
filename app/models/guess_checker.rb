class GuessChecker
  include ActiveModel::Model

  def initialize(opts={})
    @card = opts[:card]
    @user = opts[:user]
  end

  def correct_guess?(guess)
    card.back.gsub(/\s+/, '').downcase == guess.gsub(/\s+/, '').downcase
  end

  def update_guess_metrics(guess_result)
    user.increment!(:num_guesses)
    card.increment!(:num_guesses)
    if guess_result
      user.increment!(:num_correct)
      card.increment!(:num_correct)
    end
  end

  def update_attempts
    user.increment!(:num_attempts)
    card.increment!(:num_attempts)
  end

  private
  attr_reader :card, :user
end
