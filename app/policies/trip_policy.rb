class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def trip_map?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    update?
  end
end
