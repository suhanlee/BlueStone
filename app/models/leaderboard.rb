class Leaderboard < ActiveRecord::Base
	belongs_to :app
	has_many :scores, :dependent => :destroy


	def api_fields(base_uri)
		{
			:id => id,
			:app_id => app_id,
			:name => name,
			:create_at => created_at,
			:updated_at => updated_at
		}
	end
end
