# frozen_string_literal: true

FactoryBot.define do
  factory :education do
    university { 'BSUIR' }
    faculty { 'FKSIS' }
    department { 'VMSIS' }
    entrance_year { '2016' }
    graduation_year { '2020' }
    english_level { 'A1' }
    user
  end
end
