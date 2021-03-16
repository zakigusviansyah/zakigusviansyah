class AccountsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(resource_params)
        user.save
        redirect_to new_account_path, notice: 'Registrasi Berhasil'
    end

    private

    def resource_params
        params.require(:user).permit(:name, :username, :password)
    end
end