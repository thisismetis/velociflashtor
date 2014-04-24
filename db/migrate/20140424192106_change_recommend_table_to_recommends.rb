class ChangeRecommendTableToRecommends < ActiveRecord::Migration
  def change
    rename_table :recommend, :recommends
  end
end
