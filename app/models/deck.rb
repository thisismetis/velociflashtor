class Deck < ActiveRecord::Base

  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :likes, dependent: :destroy

  validates :name, presence: true,
    uniqueness: { scope: :user, message: 'must be unique' }

  def self.shuffle
    order('RANDOM()')
  end

  def tag_list
    tags.pluck(:name).join(', ')
  end

  def tag_list=(tag_string)
    self.tags = Tag.from_tag_list(tag_string)
  end

  def num_correct
    cards.sum(:num_correct)
  end
  
  def num_attempts
    cards.sum(:num_attempts)
  end

  def num_guesses
    cards.sum(:num_guesses)
  end

  def num_cards
    cards.count
  end
end
