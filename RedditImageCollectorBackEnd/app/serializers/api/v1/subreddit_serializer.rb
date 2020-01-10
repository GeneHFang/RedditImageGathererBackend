class Api::V1::SubredditSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :url, :users
end
