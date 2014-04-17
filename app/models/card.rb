class Card < ActiveRecord::Base
  belongs_to :deck

  def check_guess(guess)
    back.gsub(/\s+/, '').downcase == guess.gsub(/\s+/, '').downcase
  end
end
