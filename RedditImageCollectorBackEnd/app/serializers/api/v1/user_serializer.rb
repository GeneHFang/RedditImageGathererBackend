class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :dark_mode, :nsfw_flag, :created_at, :subreddits, :images
end
