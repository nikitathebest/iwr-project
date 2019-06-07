class EducationsController < ApplicationController

  def edit
    @profile = Profile.find(params[:user_id])
    authorize @profile
    @user = current_user
    @education = current_user.education
  end

  def update
    @profile = Profile.find(params[:user_id])
    authorize @profile
    @user = current_user
    @education = current_user.education

    if @education.update_attributes(education_params)
      redirect_to @profile
    else
      render :edit
    end
  end
   
  private
    def education_params
      params.require(:education).permit(:highschool, :faculty, :department, :year_of_start, :year_of_end, :english)
    end
end
