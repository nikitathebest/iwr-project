# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EducationCreateService do
  subject { EducationCreateService.new(user_id: user.id) }
  let(:user) { create(:user) }

  describe '#call!' do
    it 'create Education with no validation' do
      expect { subject.call! }.to change { Education.all.count }.by(1)
    end
  end
end
