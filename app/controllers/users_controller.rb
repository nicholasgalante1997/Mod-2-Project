class UsersController < ApplicationController

    def index
        @users = User.all 
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else 
            flash[:user_errors] = @user.errors.full_messages
            redirect_to new_user_path 
        end 
    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :password, :age)
    end 

end
