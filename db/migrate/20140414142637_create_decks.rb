class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.belongs_to :user
      t.string :name, index: true

      t.timestamps
    end
  end
end
