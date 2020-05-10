class ItinerariesController < ApplicationController

before_action :require_user_logged_in
before_action :correct_user_itinerary, only: [:destroy, :update, :edit]
before_action :correct_user_tournew, only: [:new, :edit]
before_action :correct_user_tourcreate, only: [:create, :update]


  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      flash[:success]="行程を登録しました"
      redirect_to @tour
    else
      flash[:danger]="行程を登録できませんでした"
      render :new
    end
  end

  def edit
  end

  def update
    if @itinerary.update(itinerary_params)
      flash[:sucess] = "更新に成功しました"
      redirect_to @tour
    else
      flash[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @itinerary.destroy
    flash[:success] = "行程を削除できました"
    redirect_back(fallback_location: root_path)
  end

  def show
    @tour = Tour.find(params[:id])
    @itinerary = @tour.itineraries.where(id: params[:id])
  end
  
  private
  
  def correct_user_itinerary
    @itinerary = Itinerary.find_by(id: params[:id])
    
    if !@itinerary
      redirect_to root_url
    end 
  end
  
  def correct_user_tournew
    @tour = current_user.tours.find_by(id: params[:tour_id])
    
    if !@tour
      redirect_to root_url
    end 
  end

  def correct_user_tourcreate
    @tour = Tour.find(params[:itinerary][:tour_id])
    
    if !@tour
      redirect_to root_url
    end 
  end
  
  def itinerary_params
    params.require(:itinerary).permit(:content, :depart_time, :depart_place, :moving_way, :todo, :note, :tour_id)
  end
end
