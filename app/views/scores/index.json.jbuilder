json.array!(@scores) do |score|
  json.extract! score, :leaderboard_id, :user_id, :value, :display_string
  json.url score_url(score, format: :json)
end
