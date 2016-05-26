class ChallengeController < ApplicationController
  def show
    user_id = params[:id]
    lock_token = params[:token]
    user = User.find(user_id)
    if user && user.lock_token && user.lock_token == lock_token
      user.lock_token = nil
      user.save
    end
  end
end
