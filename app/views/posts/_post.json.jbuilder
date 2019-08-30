json.extract! post, :id, :blog, :image, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
