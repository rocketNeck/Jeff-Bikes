class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:update, :destroy]

  def create
    @bike = Bike.find(params[:bike_id])
    @comment = @bike.comments.create(post_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @bike}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to @bike, error: "Can not leave comment empty" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    bike = Bike.find_by_id(params[:bike_id])
    comment = bike.comments.find_by_id(params[:id])
    comment.destroy
    redirect_to bike
  end

  private
  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end
  def post_params
    params.require(:comment).permit(:content, :user_id, :bike_id)
  end
end
