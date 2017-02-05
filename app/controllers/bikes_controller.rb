class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @bikes = Bike.tagged_with(params[:tag])
    else
      @bikes = Bike.all #TODO soon to use search params ###### .search(params[:field], params[:search])
    end
  end

  def show
  end

  def new
    @bike = current_user.bikes.build
  end

  def edit
    if current_user.id == @bike.user.id ##TODO create admin role || current_user.is_admin?
      #set @photos
    else
      redirect_to root_path, notice: "You don not have permission."
    end
  end

  def create
    @bike = current_user.bikes.build(bike_params)
    binding.pry
    respond_to do |format| #web service support format response depending on http request
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render :show, status: :created, location: @bike }
      else
        format.html { render :new }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Updated...' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to bikes_url, notice: 'Bike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

  def set_bike
    @bike = Bike.find_by_id(params[:id])
  end

  def bike_params
  params.require(:bike).permit(:company,
                               :year,
                               :month,
                               :serial_number_1,
                               :serial_number_2,
                               :model,
                               :rim_size,
                               :bike_type,
                               :metal,
                               :top_tube,
                               :head_tube,
                               :color,
                               :serial_number_location,
                               :user_id,
                               :photo,
                               all_tags: [:id, :name1, :name2, :name3, :name4]
                              )
  end
end
