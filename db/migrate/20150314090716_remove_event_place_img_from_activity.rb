class RemoveEventPlaceImgFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :event_place_img, :string
  end
end
