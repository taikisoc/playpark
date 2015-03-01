class UserMailer < ApplicationMailer


  default from: "from@example.com"

  def registration_confirmation(apo)
    # @title = post.title
    mail to: apo.user.email, subject: "#{apo.user.nickname}さんからランチの申請がありました！"
  end

end

