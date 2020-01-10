class CreateUserSubreddits < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subreddits do |t|
      t.belongs_to :user
      t.belongs_to :subreddit

      t.timestamps
    end
  end
end
