require 'rails_helper'

RSpec.describe EducationsController, type: :controller do
  let(:education) { Education.create(valid_params)}
  let(:valid_params) do
    {
      highschool: 'BSUIR',
      faculty: 'FKSIS',
      department: 'VMSIS',
      year_of_start: '2016',
      year_of_end: '2020',
      english: 'A1'
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

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: education.id }
      expect(response).to be_successful
    end

    it 'renders educations#show template' do
      get :show, params: { id: education.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'renders educations#new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { id: education.id }
      expect(response).to be_successful
    end

    it 'renders educations#edit template' do
      get :edit, params: { id: education.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'when valid' do
      it 'redirects to education' do
        post :create, params: { education: valid_params }
        expect(response).to redirect_to(education_path(assigns(:education)))
      end

      it 'creates a new record in the database' do
        expect {
          post :create, params: { education: valid_params }
        }.to change(Education, :count).by(1)
      end
    end

    context 'when invalid' do
      it 'renders educations#new template' do
        post :create, params: { education: invalid_params }
        expect(response).to render_template(:new)
      end

      it 'does not create a new record in the database' do
        expect {
          post :create, params: { education: invalid_params }
        }.not_to change(Education, :count)
      end

      it 'returns a successful response' do
        post :create, params: { education: invalid_params }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
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
        put :update, params: { id: education.id, education: valid_attribute }
        expect(education.reload.faculty).to eq('IEF')
      end

      it 'redirects to education' do
        put :update, params: { id: education.id, education: valid_attribute }
        expect(response).to redirect_to(education_path(education.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the record in the database' do
        put :update, params: { id: education.id, education: invalid_attribute }
        expect(education.reload.faculty).to eq('FKSIS')
      end
      it 'renders educations#edit template' do
        put :update, params: { id: education.id, education: invalid_attribute }
        expect(response).to render_template(:edit)
      end
    end
  end

end
