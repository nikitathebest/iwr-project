# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = UserCreateService.new(user_params).call
    redirect_to root_path if log_in @user
  end

  def edit
    @user = User.find(user_params)
    authorize @user
  end

  def update
    @user = User.find(params[:user_id])
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to profile_path(user_profile_id)
    else
      flash[:danger] = 'Oops'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    authorize @user
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname,
                                 :email, :password, :password_confirmation)
  end

  def user_profile_id
    @user.profile.id
  end
end
