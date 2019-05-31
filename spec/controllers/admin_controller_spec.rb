# frozen_string_literal: true
# rubocop:disable all
require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let(:admin) { User.create(valid_params) }
  let(:valid_params) do
    {
      name: 'Boris',
      surname: 'Tsarikov',
      email: 'example@example.com',
      password: '1234567',
      role: :admin
    }
  end
  let(:invalid_params) do
    {
      name: nil,
      surname: nil,
      email: nil,
      password: nil
    }
  end
end
