class Venue < ApplicationRecord
  has_many :gigs, dependent: :destroy
  has_many :bands, through: :gigs

  has_many :venue_users
  has_many :users, through: :venue_users

end
