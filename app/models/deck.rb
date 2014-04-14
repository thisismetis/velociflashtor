class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  def get_cards
    card_collection = cards.shuffle
  end
end
