class UserSubreddit < ApplicationRecord
    belongs_to :subreddit
    belongs_to :user
end
