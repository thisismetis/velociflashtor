class User < ActiveRecord::Base
  include Clearance::User
  has_many :decks, dependent: :destroy
  has_many :tags, through: :decks
  has_many :recommends, dependent: :destroy

  def recommend(deck)
    recommends.create(deck: deck)
  end

  def unrecommend(deck)
    recommend = recommends.find_by(deck: deck)
    recommend.destroy
  end

  def recommends?(deck)
    recommends.exists?(deck: deck)
  end
end
