class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Clearance::Authentication
  include ClearanceAuthenticationMonkeyPatch

  protect_from_forgery with: :exception

  def index
    redirect_to account_path if signed_in?
  end
end
