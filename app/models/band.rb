class Band < ApplicationRecord
  has_many :users
  has_many :gigs
  has_many :venues, through: :gigs
  belongs_to :genre
end
