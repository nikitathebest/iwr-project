class EducationsController < ApplicationController
  # def show
  #   @education = Education.find(params[:id])
  # end

  def new
    @education = Education.new
  end

  def edit
    @profile = Profile.find(params[:user_id])
    authorize @profile
    # @education = Education.find(params[:id])
    @user = current_user
    # @education = Education.where(user_id: @user.id)
    @education = current_user.education
    # @education = Education.find(params[:user_id])
  end

  # def create
  #   @education = Education.new(education_params)
   
  #   if @education.save
  #     redirect_to @education
  #   else
  #     render :new
  #   end
  # end

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
