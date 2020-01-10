class AddSubredditNameToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :subreddit_name, :string
  end
end
