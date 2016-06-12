class Authentication < ActiveRecord::Base
  has_one :challenge
  belongs_to :user
  def status
    AuthenticationStatus.new(challenge, user)
  end
end

class AuthenticationStatus
  def initialize(challenge, user)
    @user = user
    @challenge = challenge
  end

  def challenge?
    @challenge.present? && !@challenge.confirmed
  end

  def lock?
    @user.lock?
  end
end
