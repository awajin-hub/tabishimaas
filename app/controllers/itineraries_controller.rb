class ItinerariesController < ApplicationController
  def new
    
    #@tour = current_user.tours.find_by(id: params[:id])
    @itinerary = Itinerary.new
  end

  def create
    @tour = current_user.tours.find(params[:id])
    @itinerary = @tour.inineraries.build(itinerary_params)
    if @itinerary.save
      flash[:success]="行程を登録しました"
      redirect_to @itinerary
    else
      flash[:danger]="行程を登録できませんでした"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @itinerary.destroy
    flash[:success] = "行程を削除できました"
    redirect_back(fallback_location: root_path)
  end

  def show
    @tour = Tour.find(params[:id])
    @itinerary = tour.itineraries.find(params[:id])
    @itineraries = tour.itineraries.order(id: :desc).page(params[:page])
  end
  
  private
  
  def correct_user
    @tour = current_user.tours.find_by(id: params[:id])
    @itinerary = @tour.itineraries.find_by(id: params[:id])
    
    if !@itinerary
      redirect_to root_url
    end 
  end

end
