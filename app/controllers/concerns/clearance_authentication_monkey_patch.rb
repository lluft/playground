module ClearanceAuthenticationMonkeyPatch
  extend ActiveSupport::Concern

  included do
    private(
      :sign_in,
      :sign_in_without_castle_guard
    )
  end

  def sign_in(user, &block)
    castle_authentication = castle.authentications.create(user_id: user.id)
    clearance_session.castle_authentication = castle_authentication

    clearance_session.sign_in(user, &block)
  end

  def sign_in_without_castle_guard(user, &block)
    clearance_session.sign_in(user, &block)
  end
end
