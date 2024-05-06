class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to new_book_path
    else
      render :edit
    end 
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to new_book_path(@user.id)
    else
      render :edit
    end 
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end 
    
end
