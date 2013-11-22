class App < ActiveRecord::Base
	belongs_to :developer
	has_many :leaderboards, :dependent => :destroy
end
