class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck, counter_cache: true

  validates :user_id, uniqueness: { scope: :deck_id }
end
