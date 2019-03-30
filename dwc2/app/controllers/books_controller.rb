class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book)
    else
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end

    def correct_user
      @user = User.find(params[:id])
      if current_user != @user
        flash[:notice] = "権限がありません"
        redirect_to books_path
      end
    end

end
