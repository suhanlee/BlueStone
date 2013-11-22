class DeveloperHasManyApps < ActiveRecord::Migration
  def up
	add_column "apps", "developer_id", :integer
  end
  def down
	remove_column "apps", "developr_id"
  end
end
