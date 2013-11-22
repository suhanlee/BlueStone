class AppHasManyLeaderboards < ActiveRecord::Migration
  def up
	add_column "leaderboards", "app_id", :integer
  end
  def down
	remove_column "leaderboards", "app_id"
  end
end
