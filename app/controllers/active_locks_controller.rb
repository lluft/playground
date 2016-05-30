class ActiveLocksController < ApplicationController
  before_filter :lock_resolved

  def lock_resolved
    if current_user
      redirect_to account_path unless current_user.lock?
    end
  end
end


