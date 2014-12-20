class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.present? && user.premium?
  end

  def update?
    user.present? && user.premium?
  end

  def index?
    user.present? && user.premium?
  end
end
