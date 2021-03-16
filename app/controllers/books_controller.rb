class BooksController < ApplicationController
    before_action :user_signed_in?
   # layout :false
   layout 'jamonrails'
    def index #Menampilkan seluruh data
        @books = Book.all
    end

    def show #Menampilkan satu data row secara detail
        id = params[:id]
        @book = Book.find(id)
    end

    def new #Membuat data baru/Menampilkan form
        @book = Book.new(title: '')
    end

    def create #Memproses di controller
        @book = Book.new(resource_params)
        if @book.save
        flash[:notice] = 'Book Has Been Created'
        redirect_to books_path
        else
        render 'new'
        end
    end
    def edit #Mengedit
        @book = Book.find(params[:id])
    end

    def update #Menyimpan edit
        @book = Book.find(params[:id])
        @book.update(resource_params)
        flash[:notice] = 'Book Has Been Updated'
        redirect_to book_path
    end

    def destroy #Menghapus data
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = 'Book Has Been Deleted'
        redirect_to books_path
    end
    private
    def resource_params
        params.require(:book).permit(:title, :description, :page, :price)
    end
end