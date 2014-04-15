class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.pluck(:name).join(', ')
  end

  def tag_list=(tag_string)
    self.tags = Tag.from_tag_list(tag_string)
  end
end
