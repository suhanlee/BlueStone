json.array!(@leaderboards) do |leaderboard|
  json.extract! leaderboard, :icon, :name
  json.url leaderboard_url(leaderboard, format: :json)
end
