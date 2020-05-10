class UsersController < ApplicationController

before_action :require_user_logged_in, only: [:tours]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to login_path
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end
  
  def tours
    @tours = current_user.tours.order(id: :desc).page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
