class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:book_create] = "You have created book successfully."
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    # 部分テンプレート部分
    @book = Book.new
    @user = User.find(current_user.id)
    # Books#idnexのインスタンス変数
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(book.id)
      flash[:book_create] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
