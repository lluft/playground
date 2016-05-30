class AccountsController < ApplicationController
  before_filter :authorize

  def authorize
    super

    device = Device.resolve(current_user, session, castle)
    redirect_to active_challenge_path if device.challenge?
    redirect_to active_lock_path if device.blocked?
  end

  def update
    if current_user.update_attributes params.require(:user).permit(:description)
      redirect_to account_path, notice: 'Saved!'
    else
      redirect_to account_path, notice: 'Something went wrong.'
    end
  end
end
