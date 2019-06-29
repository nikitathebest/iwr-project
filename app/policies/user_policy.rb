# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    admin? || manager?
  end

  def update?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  def manager?
    user.manager?
  end

  private

  def owner?
    user == record
  end

  def admin?
    user.admin?
  end
end
