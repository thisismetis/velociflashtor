class Card < ActiveRecord::Base
  belongs_to :deck

  validates :front, presence: true
  validates :back, presence: true
  validates :image_url, presence: true

  def percent_correct
    if num_attempts == 0
      'N/A'
    else
      average = num_correct.to_f / num_attempts.to_f
      average *= 100
      average.round(1)
    end
  end
end
