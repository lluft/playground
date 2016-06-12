class UserMailer < ApplicationMailer
  layout 'mail'

  def challenge(user, challenge)
    @user = user
    @challenge_token = challenge.token
    @authentication_id = challenge.authentication.castle_authentication_id
    mail(to: user.email, subject: 'Is this you?')
  end
end
