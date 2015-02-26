json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :email, :avatar, :location, :about
  json.url user_url(user, format: :json)
end
