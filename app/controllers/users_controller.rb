class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bikes = @user.bikes
  end
end
