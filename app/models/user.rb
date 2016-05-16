class User < ActiveRecord::Base
  include Clearance::User
  def send_notification_email(castle_security_context)
    risk_reasons = castle_security_context.risk_reasons
    approve_url = castle_security_context.approve_url
    deny_url  = castle_security_context.deny_url
    UserMailer.suspicious_activity(self, risk_reasons, approve_url, deny_url).deliver_later
  end
end
