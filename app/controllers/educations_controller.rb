# frozen_string_literal: true

class EducationsController < ApplicationController
  def edit
    @education = current_user.education
  end

  def update
    @user = current_user
    @education = current_user.education

    if @education.update_attributes(education_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def education_params
    params.require(:education).permit(:university, :faculty, :department,
                                      :entrance_year, :graduation_year,
                                      :english_level)
  end
end
