class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end
    def show
        id = params[:id]
        @author = Author.find(id)
    end
    def new
        @author = Author.new
    end
    def create
        author = Author.new(resource_params)
        author.save
        flash[:notice] = 'Author Has Been Created'
        redirect_to authors_path
    end
    def edit
        @author = Author.find(params[:id])
    end
    def update
        @author = Author.find(params[:id])
        @author.update(resource_params)
        flash[:notice] = 'Author Has Been Updated'
        redirect_to author_path
    end
    def destroy
        @author = Author.find(params[:id])
        @author.destroy
        flash[:notice] = 'Author Has Been Deleted'
        redirect_to authors_path
    end
    private
    def resource_params
        params.require(:author).permit(:name, :addres, :old)
    end
end