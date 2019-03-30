class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

private 
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end
  end
  
end
