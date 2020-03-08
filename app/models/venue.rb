class Venue < ApplicationRecord
  has_many :gigs
  has_many :bands, through: :gigs
  has_many :users
end
