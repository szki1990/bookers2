class UsersController < ApplicationController
  
  def edit
    @user = User.find(params[:id])
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end 
    
end
