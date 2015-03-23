class AddEventWhatToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :event_what, :text
  end
end
