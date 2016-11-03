class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :update, Product
      else
        can :update, Comment do |comment|
          comment.user == user
        end
        can :destroy, Comment do |comment|
          comment.user == user
        end
        can :create, Comment
        can :read, :all
      end
      #can :manage, User, id: user.id
  end
end
