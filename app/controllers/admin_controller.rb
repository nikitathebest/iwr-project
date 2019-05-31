# frozen_string_literal: true

# Controller
class AdminController < ApplicationController
  def index
    if logged_in? && current_user.admin?
      @users = User.all
    else
      redirect_to root_url
      flash[:danger] = 'Access denied.'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_index_path
      flash[:success] = 'User destroyed.'
    else
      flash.now.alert = 'Something went wrong.'
    end
  end
end
