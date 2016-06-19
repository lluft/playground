SKIP_CASTLE_GUARD = false

class ChallengeController < ApplicationController
  def get
    challenge_token = params[:challenge_token]

    # TODO: Replace with real challenge token
    authentication = castle.authentications.find(challenge_token)
    if authentication
      user = User.find(authentication.user_id)
      sign_in_without_castle_guard(user)

      redirect_to account_path
    end
  end
end
