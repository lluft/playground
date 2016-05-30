class ActiveChallengesController < ApplicationController
  before_filter :challenge_resolved

  def challenge_resolved
    if session[:castle_id]
      device = Device.find_by castle_id: session[:castle_id]
      redirect_to account_path unless device.challenge?
    end
  end
end
