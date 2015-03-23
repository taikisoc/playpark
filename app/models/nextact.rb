class Nextact < ActiveRecord::Base
  has_attached_file :next_event_img,
                    styles: {medium: "300*300" ,thumb: "100*100"}
  validates_attachment_content_type :next_event_img,
                                    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
