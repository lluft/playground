SKIP_CASTLE_GUARD = false

class ChallengeController < ApplicationController
  def get
    challenge_token = params[:challenge_token]
    user_id = params[:user_id]
    authentication = castle.authentications.find(challenge_token)

    if authentication.user_id == user_id
      user = User.find(user_id)
      sign_in_without_castle_guard(user)

      redirect_to account_path
    end
  end
end
