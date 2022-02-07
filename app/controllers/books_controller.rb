class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = @user.books

  end


  def edit
  end

end
