# frozen_string_literal: true

# Controller for users
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      ProfileCreateService.new(user_id: @user.id).call!
      log_in @user
      flash[:success] = 'Welcome, registration is successful.'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname,
                                 :email, :password, :password_confirmation)
  end
end
