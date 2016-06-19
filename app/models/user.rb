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

  def challenge(castle_authentication)
    # TODO: Replace with real token
    challenge_token = castle_authentication.id
    UserMailer.challenge(self, challenge_token).deliver_later
  end
end
