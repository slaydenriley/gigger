class User < ApplicationRecord
  belongs_to :band
  has_many :gigs, through: :band

  has_secure_password
end
