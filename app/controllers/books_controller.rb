class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = User.find(current_user.id) #ログインしているユーザー
    @book = Book.new #新規投稿の部分テンプレート
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user #URLを入力しても画面に飛ばせない
      render "edit"
    else
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'You have created book successfully.'  #詳細表示画面
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render "index"
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
