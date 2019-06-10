# frozen_string_literal: true

FactoryBot.define do
  factory :education do
    highschool { 'BSUIR' }
    faculty { 'FKSIS' }
    department { 'VMSIS' }
    year_of_start { '2016' }
    year_of_end { '2020' }
    english { 'A1' }
    user
  end
end
