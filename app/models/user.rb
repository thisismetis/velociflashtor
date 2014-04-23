class User < ActiveRecord::Base
  include Clearance::User
  has_many :decks, dependent: :destroy
  has_many :tags, through: :decks
  has_many :likes, dependent: :destroy

  def recommend(deck)
    likes.create(deck: deck)
  end

  def unrecommend(deck)
    like = likes.find_by(deck: deck)
    like.destroy
  end

  def recommends?(deck)
    likes.exists?(deck: deck)
  end
end
