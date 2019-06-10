# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EducationCreateService do
  subject { EducationCreateService.new(user_id: user.id) }
  let(:user) { User.create(user_params) }
  let(:user_params) do
    {
      name: 'TestName',
      surname: 'TestSurname',
      email: 'test@example.com',
      password: '1234567',
      password_confirmation: '1234567'
    }
  end
  describe '#call!' do
    it 'create Education with no validation' do
      expect { subject.call! }.to change { Education.all.count }.by(1)
    end
  end
end
