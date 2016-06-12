require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  test 'should generate challenge token' do
    challenge = Challenge.new(authentication: authentications(:one))
    assert challenge.token
  end
end
