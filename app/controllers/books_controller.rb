class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(params[:book_id])
  end

  def show
    @books = Book.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
