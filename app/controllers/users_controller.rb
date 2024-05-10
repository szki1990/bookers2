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
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save 
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      @users = User.all
      render:index
    end 
  end 
  
  def show
    @book = Book.new
    @books = Book.all
    @user = current_user || User.find(params[:id])
    #@users = User.all
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end 
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
    
end
