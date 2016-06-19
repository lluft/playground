module ClearanceAuthenticationMonkeyPatch
  extend ActiveSupport::Concern

  included do
    :sign_in
  end

  def sign_in(user, &block)
    castle_authentication = castle.authentications.create(user_id: user.id)
    clearance_session.castle_authentication = castle_authentication

    clearance_session.sign_in(user, &block)
  end
end
