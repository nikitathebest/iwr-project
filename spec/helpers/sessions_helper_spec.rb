# frozen_string_literal: true
# rubocop:disable all

require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { User.create(valid_params) }
  let(:valid_params) do
    {
      name: 'Boris',
      surname: 'Tsarikov',
      email: 'example@example.com',
      password: '1234567'
    }
  end

  describe '#current_user' do
    context 'if logged in' do
      before do
        log_in(user)
      end
      it 'return right user' do
        expect(current_user).to eq(user)
      end
    end
    context 'if not logged in' do
      it 'return nil' do
        expect(current_user).to eq(nil)
      end
    end
  end

  describe '#log_out' do
    before do
      log_in(user)
    end
    it 'change current_user to nil' do
      expect{ log_out }.to change { current_user }.to(nil)
    end
    before do
      log_in(user)
    end
    it 'remove session' do
      expect{ log_out }.to change { session[:user_id] }.to(nil)
    end
  end

  describe '#log_in' do
    it 'log_in should return session user id when session is success' do
      expect(log_in(user)).to eq(user.id)
    end
  end
end

# rubocop:enable all
