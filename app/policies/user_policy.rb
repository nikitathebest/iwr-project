# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def manager?
    user.manager?
  end

  private

  def owner?
    user == record
  end
end
