class Card < ActiveRecord::Base
  belongs_to :deck

  def check_guess(guess)
    back.downcase == guess.downcase || back.gsub(/\s+/, '').downcase == guess.gsub(/\s+/, '').downcase
  end
end
