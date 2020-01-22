class AddWebUrlToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :web_url, :string
  end
end
