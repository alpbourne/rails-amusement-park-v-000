class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

end
