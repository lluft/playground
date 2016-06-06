class ActiveChallengesController < ApplicationController
  before_filter :challenge_resolved

  def challenge_resolved
    if current_user
      authentication = Authentication.find_by(
        session_id: session_id,
        user_id: user.id
      )
      redirect_to account_path unless authentication && authentication.status.challenge?
    end
  end
end
