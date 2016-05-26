class Device < ActiveRecord::Base
  belongs_to :user

  def self.resolve(user, session_id)
    Device.find_or_create_by(user_id: user.id)
  end

  def challenge!
    return if challenge_token.present?
    
    challenge_token = 123456789
    notify_user_with_challenge(challenge_token)
  end

  def challenge?
    challenge_token.present?
  end

  def blocked?
    user.locked
  end
end
