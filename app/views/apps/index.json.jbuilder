json.array!(@apps) do |app|
  json.extract! app, :icon, :name, :app_key
  json.url app_url(app, format: :json)
end
