class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :icon
      t.string :name
      t.string :app_key

      t.timestamps
    end
  end
end
