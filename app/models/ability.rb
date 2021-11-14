class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, :all
      else
        can :read, Survey
        can :create, Response
      end
    else
      cannot :manage, :all
    end
  end
end
