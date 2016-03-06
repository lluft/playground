class UsersController < Clearance::UsersController
  def create
    super
    if @user.errors.empty?
      castle.track(
        name: '$login.succeeded',
        user_id: @user.id)
    end
  end
end
