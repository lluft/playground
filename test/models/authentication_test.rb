require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase  
  test 'should have a challenge' do
    authentication = authentications(:one)
    authentication.create_challenge!
    authentication.challenge.token
    assert authentication.challenge.token
  end
end
