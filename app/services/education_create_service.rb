# frozen_string_literal: true

# Service for Education create
class EducationCreateService
  attr_reader :user_id

  def initialize(params)
    @user_id = params[:user_id]
  end

  def call!
    save_education!
  end

  private

  def save_education!
    education = Education.new(user_id: user_id)
    education.save(validate: false)
  end
end
