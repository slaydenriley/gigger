# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can [:create, :new], User
    if user.present?
      if user.admin?
        can :manage, :all
      elsif user.account_type == "band_member"
        Band.all.each do |band|
          band.users.each do |owners|
            if owners.id == user.id
              can :manage, band
              can :manage, band
            end
          end
        end
        can :create, Band
        can :manage, User, id: user.id
        can :manage, Gig, id: user.id
        can :read, :all
      elsif user.account_type == "venue_manager"
        Venue.all.each do |venue|
          venue.users.each do |owners|
            if owners.id == user.id
              can :manage, venue
              can :manage, venue
            end
          end
        end
        can :create, Venue
        can :manage, User, id: user.id
        can :manage, Gig, id: user.id
        can :read, :all
      elsif user.account_type == "concert_goer"
        can :manage, User, id: user.id
      else
        can :read, :all
      end
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
