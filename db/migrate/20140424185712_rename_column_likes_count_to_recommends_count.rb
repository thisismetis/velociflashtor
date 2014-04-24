class RenameColumnLikesCountToRecommendsCount < ActiveRecord::Migration
  def change
    rename_column :decks, :likes_count, :recommends_count
  end
end
