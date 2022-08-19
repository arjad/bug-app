class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
      if user.usertype == "Manager"
        # puts "==========manager can manage all"
        can :manage, :all
      elsif user.usertype == "SQA"
        # puts "======== sqa "
        can :read, :all
        can :read, Project
        cannot :create, Project
        cannot :update, Project
        cannot :destroy, Project

        can :manage, Bug

      elsif user.usertype == "Developer"
        # puts "======== dev "
        can :read, :all
        cannot :create, Project
        cannot :update, Project
        cannot :destroy, Project

        can :read, Bug
        cannot :create, Bug
        cannot :update, Bug
        cannot :destroy, Bug
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
