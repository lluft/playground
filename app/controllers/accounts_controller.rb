class AccountsController < ApplicationController
  before_filter :authorize

  def authorize
    super
    castle_session = CastleSession.find_by_session_id(session.id)
    
    if castle_session == nil
      authentication = castle.authentications.create(user_id: current_user.id)
      castle_session = CastleSession.new(session.id, authentication.device_id, authentication.risk, current_user.id)
      castle_session.save
    end

    redirect_to challenge_path if castle_session.status.challenged?
    redirect_to blocked_path if castle_session.status.blocked?
  end
  

  def update
    if current_user.update_attributes params.require(:user).permit(:description)
      redirect_to account_path, notice: "Saved!"
    else
      redirect_to account_path, notice: "Something went wrong."
    end
  end
end