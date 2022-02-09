class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    # 部分テンプレート部分
    @user = User.find(current_user.id)
    # @book = @user.books

    # Books#idnexのインスタンス変数
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
