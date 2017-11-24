class SantaMailer < ApplicationMailer
  def santa_notification(santa)
    @santa = santa
    @recipient = santa.recipient.user
    @user = santa.user
    mail to: @user.email, subject: 'Your Tiny Santa information'
  end
end
