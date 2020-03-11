class User < ApplicationRecord
  has_many :band_users
  has_many :bands, through: :band_users

  has_many :venue_users
  has_many :venues, through: :venue_users

  has_many :gigs, through: :bands
  has_many :genres, through: :bands
  accepts_nested_attributes_for :bands
  accepts_nested_attributes_for :venues

  has_secure_password

end
