class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @bikes = @user.bikes
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user}
    end
  end
end
