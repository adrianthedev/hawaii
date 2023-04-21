class IslandPolicy < ApplicationPolicy
  def edit?
    user.is_owner?
  end

  def destroy_users?
    false
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
