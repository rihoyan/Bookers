class BooksController < ApplicationController
  def top
    # top画面からリンクでnewに飛ぶ
  end

  def new
    # 投稿画面に渡すためのインスタンス変数を生成する
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books/:id'
  end

  def show
  end

  def edit
    # 編集画面に渡すためのインスタンス変数を生成する
  end

  private
  # 必要な情報だけを保存するために設定する
  def book_params
    params.require(:book).permit(:title, :body)
  end
end