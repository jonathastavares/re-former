class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find(params[:id])
    redirect_to edit_user_path(@user.id) if @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
