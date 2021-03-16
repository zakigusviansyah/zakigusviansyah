class SessionsController < ApplicationController
    def new
        
    end

    def create
        username = params[:username]
        password = params[:password]

        user = User.find_by(username: username)
        if user
            if user.authenticate(password)
                redirect_to books_path, notice: 'Anda telah login'
            else
                redirect_to new_session_path, notice: 'Username atau password anda salah'
            end
        else  
            redirect_to new_session_path, notice: 'Username atau password anda salah'
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to new_session_path, notice: 'Kamu Telah Logout'
    end
end