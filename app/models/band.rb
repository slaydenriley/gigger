class Band < ApplicationRecord
  has_many :band_users
  has_many :users, through: :band_users

  has_many :gigs, dependent: :destroy
  has_many :venues, through: :gigs
  belongs_to :genre

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :genre

  def genre_attributes=(attributes)
      self.genre = Genre.find_or_create_by(attributes) if !attributes['name'].empty?
      self.genre
  end

end
