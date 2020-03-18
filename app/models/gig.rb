class Gig < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  validates :name, presence: true
  validates :band_id, presence: true
  validates :venue_id, presence: true

  def start_date
    self.date.strftime("%m/%d/%Y")
  end

  def start_time
    self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
