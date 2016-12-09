json.extract! location, :id, :city_id, :name, :address, :created_at, :updated_at
json.url location_url(location, format: :json)