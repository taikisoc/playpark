class AddAttachmentEventImg3ToActivities < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.attachment :event_img3
    end
  end

  def self.down
    remove_attachment :activities, :event_img3
  end
end
