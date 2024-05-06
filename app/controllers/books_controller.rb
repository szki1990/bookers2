class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end 
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book)
    else
      render :index
    end 
  end 

  def index
   
  end

  def show
    
  end 
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end 
  
end 