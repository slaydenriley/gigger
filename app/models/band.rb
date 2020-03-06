class Band < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :gigs
  has_many :venues, through: :gigs
  belongs_to :genre
end
