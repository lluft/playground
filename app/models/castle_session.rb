class CastleSession < ActiveRecord::Base

  enum status: [ :blocked, :challenged, :confirmed ]

  def initialize(session_id, device_id, risk, user_id)
    @session_id = session_id
    @device_id = device_id
    @user_id = user_id
    @risk = risk

    if authentication.risk > 0.9
      @status = :blocked 
    elsif authentication.risk > 0.6
      @status = :challenged
    else
      @status = :confirmed
    end

    super()
  end

end
