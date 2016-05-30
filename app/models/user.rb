class User < ActiveRecord::Base
  include Clearance::User

  def lock!
    unless lock
      update_attribute(:lock, true)
      forgot_password!
      ClearanceMailer.change_password(self).deliver_later
    end
  end

  def unlock!
    update_attribute(:lock, false)
  end

  def send_notification_email(castle_security_context)
    risk_reasons = castle_security_context.risk_reasons
    approve_url = castle_security_context.approve_url
    deny_url = castle_security_context.deny_url
    
    UserMailer.suspicious_activity(self, risk_reasons, approve_url, deny_url).deliver_later
  end

  def notify_user_with_challenge(challenge_token, device_id)
    UserMailer.challenge(self, challenge_token, device_id).deliver_later
  end
end
