Planning for this Project:

Models:

  -User
    -belongs_to :band
    -has_many :gigs, through: bands

      -name: string
      -email: string
      -password_digest: string
      -description: text
      -band_id:integer


  -Band
    -has_many :users
    -has_many :gigs
    -has_many :venues, through: :gigs

      -name: string
      -description: text


  -Venue
    -has_many :gigs
    -has_many :bands, through: :gigs

      -name: string
      -description: text


  -Gig
    -belongs_to :band
    -belongs_to :venue

      -date:date
      -time:time
      -band_id:integer
      -venue_id:integer
