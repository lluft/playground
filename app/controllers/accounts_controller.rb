class AccountsController < ApplicationController
  before_filter :authorize

  def authorize
    super
    authentication = AuthenticationService.resolve(
      castle,
      current_user,
      session.id
    )
    
    redirect_to active_challenge_path if authentication.status.challenge?
    redirect_to active_if_path if authentication.status.lock?
  end

  def update
    if current_user.update_attributes params.require(:user).permit(:description)
      redirect_to account_path, notice: 'Saved!'
    else
      redirect_to account_path, notice: 'Something went wrong.'
    end
  end
end
