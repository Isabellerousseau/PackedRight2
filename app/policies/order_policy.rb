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

  def edit
# as we go
  end

  def update
# as we go
  end
end
