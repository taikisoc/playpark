class AddEventTimToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :event_time, :string
    add_column :activities, :event_date, :string
  end
end
