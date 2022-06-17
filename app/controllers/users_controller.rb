class UsersController < ApplicationController
  

  before_action :correct_user,only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      render user_path(current_user.id)
    end
     
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end  
  end
  
  def index 
    @users = User.all
    @user = current_user
  end 
  

    private
    
  def correct_user
      @user = User.find(params[:id])
      @books = @user.books
      redirect_to user_path(current_user) unless @user == current_user
  end
  
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end  
  
  
end
