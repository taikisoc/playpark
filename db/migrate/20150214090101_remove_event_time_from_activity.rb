class RemoveEventTimeFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :event_time, :time
    remove_column :activities, :event_date, :date
  end
end
