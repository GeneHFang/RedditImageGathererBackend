class AddUrlToSubreddits < ActiveRecord::Migration[6.0]
  def change
    add_column :subreddits, :url, :string
  end
end
