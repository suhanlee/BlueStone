class AddPasswordToUsers < ActiveRecord::Migration
  def up
	add_column "users", "password", :integer
  end
  def down
	remove_column "users", "password"
  end
end
