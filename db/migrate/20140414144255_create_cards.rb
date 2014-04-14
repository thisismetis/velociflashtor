class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck, index: true
      t.string :front
      t.text :back
      t.string :image_url

      t.timestamps
    end
  end
end
