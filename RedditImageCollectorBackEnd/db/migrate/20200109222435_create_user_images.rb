class CreateUserImages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_images do |t|
      t.belongs_to :user
      t.belongs_to :image

      t.timestamps
    end
  end
end
