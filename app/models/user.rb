class User < ActiveRecord::Base
  has_many :authentications
  include Clearance::User

  def notify_user_with_challenge(challenge)
    UserMailer.challenge(self, challenge).deliver_later
  end
end
