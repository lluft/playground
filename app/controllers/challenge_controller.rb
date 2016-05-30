class ChallengeController < ApplicationController
  def get
    castle_id = params[:device_id]
    challenge_token = params[:challenge_token]
    device = Device.find_by_castle_id(castle_id)
    if device.challenge_token == challenge_token
      device.challenge_token = nil
      device.save
    end

    redirect_to account_path
  end
end
