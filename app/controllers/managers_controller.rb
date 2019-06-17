# frozen_string_literal: true

class ManagersController < ApplicationController
  def show
    @manager = current_user
    authorize @manager, :manager?
    @users = User.all
  end
end
