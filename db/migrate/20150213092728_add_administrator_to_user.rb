class AddAdministratorToUser < ActiveRecord::Migration
  def change
    add_column :users, :administrator, :integer
  end
end
