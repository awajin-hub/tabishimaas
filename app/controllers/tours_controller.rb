class ToursController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :destroy, :edit, :update]
  
  def show
    @itinerary = @tour.itineraries.where(tour_id: params[:id])
  end

  def create
    @tour = current_user.tours.build(tour_params)
    if @tour.save
      flash[:success] = "計画を登録しました"
      redirect_to @tour
    else
      flash[:danger] = "計画登録に失敗しました"
      render :new
    end
  end

  def new
    @tour = Tour.new
  end

  def index
    @tours = Tour.all
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
      flash[:success] = "計画を変更しました"
      redirect_to @tour
    else
      flash[:danger] = "計画の変更に失敗しました"
      render :edit
    end    
  end

  def destroy
    @tour.destroy
    flash[:success] = "計画は正常に削除されました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def tour_params
    params.require(:tour).permit(:tourname, :place, :date_start, :date_end )
  end
  
  def correct_user
    @tour = current_user.tours.find_by(id: params[:id])
    if !@tour
      redirect_to root_url
    end
  end
  
end
