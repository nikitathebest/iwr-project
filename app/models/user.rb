# frozen_string_literal: true

# User model
class User < ApplicationRecord
  include Authenticatable
  attr_accessor :remember_token

  enum role: [:employee, :manager, :admin, :director]
  after_initialize :set_default_role, :if => :new_record?

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :surname, presence: true, length: { minimum: 5, maximum: 50 }
  validates :email, presence: true, length: { minimum: 10, maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, presence: true, length: { minimum: 6, maximum: 200 }

  private
  
  def set_default_role
    self.role ||= :employee
  end
end
