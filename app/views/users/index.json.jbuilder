json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone, :address, :email, :type, :latitude, :longitude
  json.url user_url(user, format: :json)
end
