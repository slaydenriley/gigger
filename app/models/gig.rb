class Gig < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  def start_date
    self.date.strftime("%m/%d/%Y")
  end
end
