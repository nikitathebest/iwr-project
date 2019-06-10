# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EducationsController, type: :controller do
  let(:user) { User.create(user_params) }
  let(:education) { Education.create(valid_params) }
  let(:profile) { Profile.create(profile_params) }
  let(:user_params) do
    {
      name: 'TestName',
      surname: 'TestSurname',
      email: 'test@example.com',
      password: '1234567'
    }
  end
  let(:valid_params) do
    {
      highschool: 'BSUIR',
      faculty: 'FKSIS',
      department: 'VMSIS',
      year_of_start: '2016',
      year_of_end: '2020',
      english: 'A1',
      user_id: user.id
    }
  end
  let(:profile_params) do
    {
      telephone: '375291111111',
      country_code: 'BY',
      city: 'Minsk',
      birthday: '25.01.2017',
      user_id: user.id
    }
  end
  let(:invalid_params) do
    {
      highschool: nil,
      faculty: nil,
      department: nil,
      year_of_start: nil,
      year_of_end: nil,
      english: nil
    }
  end

  describe 'GET #edit' do
    before do
      log_in user
    end
    it 'returns a successful response' do
      get :edit, params: { user_id: education.id }
      expect(response).to be_successful
    end

    it 'renders educations#edit template' do
      get :edit, params: { user_id: education.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    before do
      log_in user
    end
    let(:valid_attribute) do
      {
        faculty: 'IEF'
      }
    end
    let(:invalid_attribute) do
      {
        faculty: 'F'
      }
    end
    context 'with valid parameters' do
      it 'updates the record in the database' do
        put :update, params: { user_id: education.id, education: valid_attribute }
        expect(education.reload.faculty).to eq('IEF')
      end

      it 'redirects to profile' do
        put :update, params: { user_id: education.id, education: valid_attribute }
        expect(response).to redirect_to(profile_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the record in the database' do
        put :update, params: { user_id: education.id, education: invalid_attribute }
        expect(education.reload.faculty).to eq('FKSIS')
      end
      it 'renders educations#edit template' do
        put :update, params: { user_id: education.id, education: invalid_attribute }
        expect(response).to render_template(:edit)
      end
    end
  end
end
