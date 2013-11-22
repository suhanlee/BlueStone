class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.string :icon
      t.string :name

      t.timestamps
    end
  end
end
