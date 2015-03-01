class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :ask_about
      t.timestamps null: false
      t.text :introduction
      t.string :where_go
      t.string :send_user
      t.string :recieve_user

    end
  end
end

