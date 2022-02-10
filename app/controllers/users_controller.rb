class UsersController < ApplicationController
  def index
    @users = User.all
    # 部分テンプレート
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
