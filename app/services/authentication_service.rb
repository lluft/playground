class AuthenticationService

  def self.resolve(castle, user, session_id)
    authentication = Authentication.find_by(
      session_id: session_id,
      user_id: user.id
    )
    authentication = AuthenticationService.create_from_castle(
      castle,
      user,
      session_id
    ) unless authentication
    
    authentication
  end

  def self.create_from_castle(castle, user, session_id)
    castle_authentication = castle.authentications.create(user_id: user.id)
    authentication = Authentication.create(
      user: user,
      castle_authentication_id: castle_authentication.id,
      session_id: session_id
    )
    
    if castle_authentication.risk > 0.9
      user.lock!
    elsif castle_authentication.risk > 0.6
      challenge = authentication.create_challenge
      user.notify_user_with_challenge(challenge)
    end
    authentication.save
    authentication
  end
end
