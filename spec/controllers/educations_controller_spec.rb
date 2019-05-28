require 'rails_helper'

RSpec.describe EducationsController, type: :controller do

  let(:education) { Education.create(valid_params)}
  let(:valid_params) do
    {
      highschool: 'BSUIR',
      faculty: 'FKSIS',
      department: 'VMSIS',
      year_of_start: '2016',
      year_of_end: '2020'
    }
  end
  let(:invalid_params) do
    {
      highschool: nil,
      faculty: nil,
      department: nil,
      year_of_start: nil,
      year_of_end: nil
    }
  end

end
