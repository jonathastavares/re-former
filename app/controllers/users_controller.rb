class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to edit_user_path(@user.id)
        else
            render :new
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to new_user_path
        else
            redirect_to edit_user_path(@user.id)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end