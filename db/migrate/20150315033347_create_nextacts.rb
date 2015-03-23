class CreateNextacts < ActiveRecord::Migration
  def change
    create_table :nextacts do |t|
      t.string :event_place
      t.text :event_what
      t.date :event_date
      t.string :event_time
      t.timestamps
    end
  end
end
