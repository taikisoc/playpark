class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :event_place
      t.string :event_station
      t.time :event_time
      t.date :event_date
      t.string :event_place_img
      t.integer :event_people
      t.string :event_bring
      t.text :event_else
      t.timestamps null: false
    end
  end
end
