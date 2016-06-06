class User < ActiveRecord::Base
  include Clearance::User

  has_many :authentications

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

  def notify_user_with_challenge(challenge)
    UserMailer.challenge(self, challenge).deliver_later
  end
end
