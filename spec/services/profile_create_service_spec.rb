# frozen_string_literal: true
# rubocop:disable all

require 'rails_helper'

RSpec.describe ProfileCreateService do
  subject { ProfileCreateService.new(user_id: user.id) }
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
    it 'create Profile with no validation' do
      expect{ subject.call! }.to change{ Profile.all.count }.by(1)
    end
  end
end

# rubocop:enable all
