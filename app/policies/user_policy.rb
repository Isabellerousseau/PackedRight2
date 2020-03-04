class UserPolicy < ApplicationPolicy
  def create?
    return true
  end

  def update?
    record == user
  end

  def edit?
    !!user
  end

  def destroy?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
