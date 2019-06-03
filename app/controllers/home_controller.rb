# frozen_string_literal: true

# Home Controller class
class HomeController < ApplicationController
  def index
    @user = User.new
  end
end
