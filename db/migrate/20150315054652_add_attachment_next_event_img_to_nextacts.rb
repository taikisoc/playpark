class AddAttachmentNextEventImgToNextacts < ActiveRecord::Migration
  def self.up
    change_table :nextacts do |t|
      t.attachment :next_event_img
    end
  end

  def self.down
    remove_attachment :nextacts, :next_event_img
  end
end
