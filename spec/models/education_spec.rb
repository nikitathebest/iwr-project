# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Education, type: :model do
  it { should belong_to(:user) }

  describe '#highschool' do
    it { should validate_presence_of(:highschool) }
    it { should validate_length_of(:highschool).is_at_least(3) }
    it { should validate_length_of(:highschool).is_at_most(15) }
  end

  describe '#faculty' do
    it { should validate_presence_of(:faculty) }
    it { should validate_length_of(:faculty).is_at_least(2) }
    it { should validate_length_of(:faculty).is_at_most(15) }
  end

  describe '#department' do
    it { should validate_presence_of(:department) }
    it { should validate_length_of(:department).is_at_least(3) }
    it { should validate_length_of(:department).is_at_most(15) }
  end

  describe '#year_of_start' do
    it { should validate_presence_of(:year_of_start) }
    it { should validate_numericality_of(:year_of_start).is_less_than(2020) }
    it { should validate_numericality_of(:year_of_start).is_greater_than(1950) }
  end

  describe '#year_of_end' do
    it { should validate_presence_of(:year_of_end) }
    it { should validate_numericality_of(:year_of_end).is_less_than(2025) }
    it { should validate_numericality_of(:year_of_end).is_greater_than(1955) }
  end
end
