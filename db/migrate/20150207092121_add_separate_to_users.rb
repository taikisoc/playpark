class AddSeparateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :separate, :integer
  end
end
