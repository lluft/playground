class CastleHookController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def post
    # Retrieve the request's body and parse it as JSON
    auth = Castle::Authentication.new(JSON.parse(request.body.read))

    # Fetch the user from your database
    # user = User.find(auth.user_id)

    if auth.risk > 0.9
      # Lock the user account and send instructions for unlocking
      # user.lock!
    elsif auth.risk > 0.3
      # Notify the user about unusual activity
      # user.send_notification_email(auth)
    end

    render :nothing => true, status => :ok
  end
end