class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
      @book =Book.new
end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
        flash[:notice] = "投稿に失敗しました。"
      @books = Book.all
      render action: :index
    end

  end

  def edit
    @book = Book.find(params[:id])


  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      @books = Book.all
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
