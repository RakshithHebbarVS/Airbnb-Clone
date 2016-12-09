class Ability
  include CanCan::Ability

  def initialize(user)


    #user ||= User.new
    if user.nil?
        can :read, Room

    elsif user.role? "admin"
        can :manage, :all
    elsif user.role? "host"
        can [:create,:read], Room
        can [:update,:destroy], Room do |room|
            room.try(:user) == user
        end
        can [:create,:read], Booking
        can [:update,:destroy], Booking do |booking|
            booking.room.try(:user) == user
        end
        can :confirm_booking, Booking do |booking|
            booking.room.try(:user) == user
        end
        can :cancel_booking, Booking do |booking|
            booking.room.try(:user) == user
        end
    elsif user.role? "guest"
        can [:create,:read], Booking
        can :read, Room
        can :manage, Wishlist
        can [:create, :read], Review 
        can [:update,:destroy], Review do |review|
            review.try(:user) == user
        end    
    end 
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
