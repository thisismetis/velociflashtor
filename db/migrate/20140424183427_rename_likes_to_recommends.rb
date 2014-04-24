class RenameLikesToRecommends < ActiveRecord::Migration
  def change
    rename_table :likes, :recommend
  end
end
