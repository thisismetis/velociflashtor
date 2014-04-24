class AddCounterCacheToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :likes_count, :integer, default: 0
  end
end
