class User < ActiveRecord::Base
  has_many :appointments, class_name: "Appointment", foreign_key: "recieve_user"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  has_attached_file :avatar,
                    :style => {medium: "300*300" ,thumb: "100*100"}
  validates_attachment_content_type :avatar,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
