class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :park_name
      t.text :image_url
      t.string :station
      t.timestamps 
    end
  end
end
