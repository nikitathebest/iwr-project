class Education < ApplicationRecord
  belongs_to :user

  validates :highschool, presence: true, length: { minimum: 3, maximum: 15}
  validates :faculty, presence: true, length: { minimum: 2, maximum: 15}
  validates :department, presence: true, length: { minimum: 3, maximum: 15}
  validates :year_of_start, presence: true, numericality: { greater_than: 1950, less_than: 2020 } 
  validates :year_of_end, presence: true, numericality: { greater_than: 1955, less_than: 2025 }

  ENGLISH = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']
end
