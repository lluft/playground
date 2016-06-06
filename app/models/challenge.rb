class Challenge < ActiveRecord::Base 
  belongs_to :authentication
  
  after_initialize do
    self.token = SecureRandom.urlsafe_base64(nil, false)
  end
end
