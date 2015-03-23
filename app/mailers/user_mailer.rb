class UserMailer < ApplicationMailer


  default from: "from@example.com"

  def registration_confirmation(apo)
    @user = apo.user
    mail to: apo.user.email, subject: "#{apo.user.nickname}さんからランチの申請がありました！"
  end

end
