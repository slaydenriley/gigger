class User < ApplicationRecord
  has_many :band_users
  has_many :bands, through: :band_users
  belongs_to :venue
  has_many :gigs, through: :bands

  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email

  attr_accessor :type
end
