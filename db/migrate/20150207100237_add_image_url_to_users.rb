class AddImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :fullname, :string
    add_column :users, :hobby_1, :string
    add_column :users, :hobby_2, :string
    add_column :users, :hobby_3, :string
    add_column :users, :introduction, :string
  end
end
