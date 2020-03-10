#frozen_string_literal: true

class DriverPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

   def show?
    return true
  end

  def update?
    !!user
  end

  def edit?
    !!user
  end

  def destroy?
    record.user == user
  end

  def driving?
    !!user
  end
end
