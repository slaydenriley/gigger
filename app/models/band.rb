class Band < ApplicationRecord
  has_many :band_user
  has_many :users, through: :band_user
  has_many :gigs
  has_many :venues, through: :gigs
  belongs_to :genre
end
