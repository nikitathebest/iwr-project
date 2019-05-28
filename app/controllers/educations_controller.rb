class EducationsController < ApplicationController


  def show
    @education = Education.find(params[:id])
  end

  def new
    @education = Education.new
  end

  def edit
    @education = Education.find(params[:id])
  end

  def create
    @education = Education.new(education_params)
   
    if @education.save
      redirect_to @education
    else
      render :new
    end
  end

  def update
    @education = Education.find(params[:id])

    if @education.update_attributes(education_params)
      redirect_to @education
    else
      render :edit
    end
  end
   
  private
    def education_params
      params.require(:education).permit(:highschool, :faculty, :department, :year_of_start, :year_of_end, :english)
    end


end
