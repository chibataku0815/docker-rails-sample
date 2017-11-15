json.extract! user, :id, :username, :password_, :digest, :email, :dm, :roles, :reviews_count, :created_at, :updated_at
json.url user_url(user, format: :json)
