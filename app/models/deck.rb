class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy

end
