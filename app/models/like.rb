class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  validates :user_id,
        uniqueness: { scope: :deck_id }
end
