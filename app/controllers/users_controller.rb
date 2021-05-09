class UsersController < ApplicationController
  


  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tunes = @user.tunes
  end

  def edit
    @user = User.find(params[:id])
    if user_signed_in? && current_user.id == @user.id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :year, :introduction)
  end


  end

