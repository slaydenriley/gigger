class Venue < ApplicationRecord
  has_many :gigs
  has_many :bands, through: :gigs
end
