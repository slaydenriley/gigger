class User < ApplicationRecord
  attr_accessor :type

  has_many :band_users
  has_many :bands, through: :band_users

  has_many :venue_users
  has_many :venues, through: :venue_users

  has_many :gigs, through: :bands

  has_secure_password
  accepts_nested_attributes_for :bands

  def bands_attributes=(bands)
    self.bands = Band.find_or_create_by(name: bands[:name])
  end
end
