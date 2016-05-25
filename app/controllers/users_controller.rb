class UsersController < ApplicationController

  def show
    @user = current_user
    @reg_app = @user.registered_applications
  end

end
