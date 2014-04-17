class AddMetricsToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :num_correct, default: 0
      t.integer :num_attempts, default: 0
      t.integer :num_guesses, default: 0
    end
  end
end
