class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end 
  end 

  def index
   
  end

  def show
    @books = Book.all
    @user = current_user
    @users = User.all
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(@book)
  end 
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end 
  
end 