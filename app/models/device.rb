class Device < ActiveRecord::Base
  belongs_to :user
  has_many :sessions, class_name: ActiveRecord::SessionStore::Session

  def self.resolve(user, castle)
    authentication = castle.authentications.create(user_id: user.id)
    device = Device.find_by castle_id: authentication.device_id
    return device if device

    device ||= Device.create(user_id: user.id,
                             castle_id: authentication.device_id)

    if authentication.risk > 0.9
      user.lock!
    elsif authentication.risk == 0.0
      device.challenge!
    elsif authentication.risk > 0.3
      # Notify the user about unusual activity
      user.send_notification_email(auth)
    end
    device
  end

  def challenge!
    return if challenge_token.present?
    
    self[:challenge_token] = SecureRandom.urlsafe_base64(nil, false)
    save
    user.notify_user_with_challenge(challenge_token, castle_id)
  end

  def challenge?
    challenge_token.present?
  end

  def blocked?
    user.locked
  end
end