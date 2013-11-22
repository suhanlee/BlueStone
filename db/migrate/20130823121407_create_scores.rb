class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :leaderboard_id
      t.integer :user_id
      t.integer :value
      t.string :display_string

      t.timestamps
    end
  end
end
