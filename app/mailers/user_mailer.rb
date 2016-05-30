class UserMailer < ApplicationMailer
  layout 'mail_suspicious_activity'
  def suspicious_activity(user, risk_reasons, approve_url, deny_url)
    @user = user
    @risk_reasons = risk_reasons
    @approve_url = approve_url
    @deny_url = deny_url
    mail(to: user.email, subject: 'Suspicious activity')
  end

  def challenge(user, challenge_token, device_id)
    @user = user
    @challenge_token = challenge_token
    @device_id = device_id
    mail(to: user.email, subject: 'Is this you?')
  end
end
