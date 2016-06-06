class Authentication < ActiveRecord::Base
  has_one :challenge
  belongs_to :user
  def status
    AuthenticationStatus.new(challenge)
  end
end

class AuthenticationStatus
  def initialize(challenge)
    @challenge = challenge
  end

  def challenge?
    @challenge.present? && !@challenge.confirmed
  end

  def lock?
    user.lock?
  end
end
