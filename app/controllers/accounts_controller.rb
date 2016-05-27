class AccountsController < ApplicationController
  before_filter :authorize

  def authorize
    super

    device = Device.find_by_castle_id(session[:castle_id])
    device ||= Device.resolve(current_user, castle)
    session[:castle_id] = device.castle_id

    # redirect_to challenge_path if device.challenged?
    # redirect_to blocked_path if device.blocked?
  end

  def update
    if current_user.update_attributes params.require(:user).permit(:description)
      redirect_to account_path, notice: 'Saved!'
    else
      redirect_to account_path, notice: 'Something went wrong.'
    end
  end
end
