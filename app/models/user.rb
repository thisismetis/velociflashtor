class User < ActiveRecord::Base
  include Clearance::User
  has_many :decks, dependent: :destroy
  has_many :tags, through: :decks
end