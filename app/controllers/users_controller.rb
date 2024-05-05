class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to :new_book_path
    else
      render :edit
    end
  end 
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to new_book_path(user.id)
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end 
    
end
