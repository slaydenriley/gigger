class User < ApplicationRecord
  belongs_to :band
  has_many :gigs, through: :band

  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
end
