class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :dark_mode
      t.string :password_digest
      t.boolean :nsfw_flag

      t.timestamps
    end
  end
end
