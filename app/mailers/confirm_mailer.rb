class ConfirmMailer < ApplicationMailer
  def confirm_message(meeting, user, client)
    @message = meeting
    @user = user
    @client = client
    mail(to: @client[:email], subject: "Confirm meeting invitation with" + @user[:email])
  end
end
