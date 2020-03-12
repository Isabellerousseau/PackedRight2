class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    !!user
  end

  def show?
    true
  end

  def edit?
    create?
  end

  def update?
    !!user
  end

  def destroy?
    !!user
  end

  def delivered?
    !!user
  end
end
