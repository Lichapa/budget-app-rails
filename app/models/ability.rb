# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all

    can :manage, Group, user: user
    can :manage, Entity, user:
  end
end
