class BooksController < ApplicationController
  
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
  
  def edit
    @book = Book.find(params[:id])
  end 
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end 

  def index
    @book = Book.new
    @books = Book.all
    @user = User.all
    #@users = @book.user
  end

  def show
    @book = Book.find(params[:id])
    #@book.user_id = current_user.id if @book.user == current_user
    #@book.user_id = current_user.id
    @books = Book.all
    #@user = current_user 
    @user = @book.user
    #@users = User.all
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