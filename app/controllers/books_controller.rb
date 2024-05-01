class BooksController < ApplicationController
  def new
    @user = User.new
    @users = User.all
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
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