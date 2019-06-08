# frozen_string_literal: true

# Controller for education
class EducationsController < ApplicationController
  def edit
    @user = current_user
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
    params.require(:education).permit(:highschool, :faculty, :department,
                                      :year_of_start, :year_of_end, :english)
  end
end
