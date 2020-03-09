class Band < ApplicationRecord
  has_many :band_users
  has_many :users, through: :band_users

  has_many :gigs
  has_many :venues, through: :gigs
  belongs_to :genre

  accepts_nested_attributes_for :users
end
