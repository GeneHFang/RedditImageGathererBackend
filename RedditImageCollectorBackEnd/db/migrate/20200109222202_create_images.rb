class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url
      t.boolean :nsfw
      t.string :file_type
      t.integer :upvotes

      t.timestamps
    end
  end
end
