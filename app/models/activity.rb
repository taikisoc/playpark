class Activity < ActiveRecord::Base
    has_attached_file :event_img1,
                    styles: {medium: "300*300" ,thumb: "100*100"}
  validates_attachment_content_type :event_img1,
                                    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    has_attached_file :event_img2,
                    styles: {medium: "300*300" ,thumb: "100*100"}
  validates_attachment_content_type :event_img2,
                                    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    has_attached_file :event_img3,
                    styles: {medium: "300*300" ,thumb: "100*100"}
  validates_attachment_content_type :event_img3,
                                    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    has_attached_file :event_p_img,
                    styles: {medium: "300*300" ,thumb: "100*100"}
  validates_attachment_content_type :event_p_img,
                                    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
