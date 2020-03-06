class User < ApplicationRecord
  belongs_to :band
  has_many :gigs, through: :bands

  has_secure_password
end
