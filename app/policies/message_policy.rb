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
    record.order.user == user || record.driver == user.driver
  end

  def destroy?
    record.order.user == user
  end

end
