class Api::V1::ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :nsfw, :upvotes, :file_type, :subreddit_name, :users
end
