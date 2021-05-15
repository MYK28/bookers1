class BooksController < ApplicationController
  def index
    @books = Book.all
    #Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    #1. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #2. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    flash[:notice] = "Book was successfully created"
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "Book was successfully updated"
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:danger] ="Book was successfully destroyed"
    redirect_to books_path
    else
    render :index
    end
  end

  private
  #ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
