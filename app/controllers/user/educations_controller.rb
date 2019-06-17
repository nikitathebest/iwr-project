# frozen_string_literal: true
class User
  class EducationsController < ApplicationController
    def edit
      # @education = User::Education.find(params[:user_id])
      @education = current_user.education


      # @user = current_user
      # @education = User::Education.find(params[:user_id])
    end

    def update
      @education = current_user.education
      
      if @education.update_attributes(education_params)
        redirect_to profile_path(current_user)
      else
        render :edit
      end
    end

    private

    def education_params
      params.require(:user_education).permit(:university, :faculty, :department,
                                        :entrance_year, :graduation_year,
                                        :english_level)
    end
  end
end
