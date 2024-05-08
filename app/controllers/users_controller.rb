class UsersController < ApplicationController
  
  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to new_book_path(@user)
    else
      render :edit
    end 
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to books_path(@user.id)
    else
      render :edit
    end 
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end 
    
end
