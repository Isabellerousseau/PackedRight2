class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    # we want to allow messages to be created if the order belongs to the current user
    record.order.user == user
  end

  def destroy?
  end

end
