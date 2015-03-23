class AddAttachmentEventPImgToActivities < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.attachment :event_p_img
    end
  end

  def self.down
    remove_attachment :activities, :event_p_img
  end
end
