class BooksController < ApplicationController
  def top
    # top画面からリンクでindexに飛ぶ
  end

  def index
    # 投稿画面に渡すためのインスタンス変数を生成する
    # 一覧表示するためのインスタンス変数を生成する
    @book = Book.new
    @books = Book.all
  end

  def create
    # create bookボタンを押した後に動くアクション
    @book = Book.new(book_params)
    if @book.save
       flash[:create] = "Book was successfully created！"
       redirect_to book_path(book)
    else
       @books = Book.all
       render :index
    end
  end

  def show
    # アクセスされたidのtitleとbodyを取得する
    @book = Book.find(params[:id])
  end

  def edit
    # 編集画面に渡すためのインスタンス変数を生成する
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:update] = "Book was successfully update！"
       redirect_to book_path(book)
    else
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
       flash[:destroy] = "Book was successfully destroyed！"
       redirect_to index_book_path
    end
  end

  private
  # 必要な情報だけを保存するために設定する
  def book_params
    params.require(:book).permit(:title, :body)
  end
end