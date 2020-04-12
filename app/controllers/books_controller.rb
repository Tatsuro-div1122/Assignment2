class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all.order(created_at: :desc)
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new

  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      flash[:notice] = 'Book was successfully created.'
  		redirect_to book_path(@book.id)
  	else
      @books = Book.all.order(created_at: :desc)
      # flash.now[:alert] = "Error"
  		render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])

  	if @book.update(book_params)
  	redirect_to book_path(@book.id)
  
  else
      # book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
