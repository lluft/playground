class CastleRiskGuard < Clearance::SignInGuard
  def call
    authentication = @session.castle_authentication
    authentication.risk = 0.7
    if authentication.risk > 0.9
      current_user.lock!
      failure('Your account is currently locked.
              Please follow the instructions in the email we\'ve sent')
    elsif authentication.risk > 0.6
      current_user.challenge(authentication)
      failure('You need to verify your identity.
              Please follow the instructions in the email we\'ve sent')
    else
      next_guard
    end
  end
end
