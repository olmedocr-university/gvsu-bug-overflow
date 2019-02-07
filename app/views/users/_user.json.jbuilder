json.extract! user, :id, :lname, :fname, :email, :thumbnail, :created_at, :updated_at
json.url user_url(user, format: :json)
