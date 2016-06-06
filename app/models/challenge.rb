class Challenge < ActiveRecord::Base 
  belongs_to :authentication
  
  after_initialize do
    unless self.token.present?
      self.token = SecureRandom.urlsafe_base64(nil, false)
    end
  end

  def resolve!(token)
    return false unless self.token == token
    self.confirmed = true
    save
  end
end
