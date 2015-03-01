class Appointment < ActiveRecord::Base
  belongs_to :user, class_name: "User",foreign_key: "recieve_user"

  after_create :after_create

  def after_create
    UserMailer.registration_confirmation(self).deliver
  end

end
