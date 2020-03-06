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

    -rails g resource User name email password_digest description:text band_id:integer --no-test-framework


  -Band
    -has_many :users
    -has_many :gigs
    -has_many :venues, through: :gigs
    -belongs_to :genre

      -name: string
      -genre: string
      -description: text

    -rails g resource Band name genre description:text genre_id:integer --no-test-framework


  -Venue
    -has_many :gigs
    -has_many :bands, through: :gigs

      -name: string
      -description: text

    -rails g resource Venue name description:text --no-test-framework


  -Gig
    -belongs_to :band
    -belongs_to :venue

      -name:string
      -date:date
      -time:time
      -band_id:integer
      -venue_id:integer
      -genre_id:integer

    -rails g resource Gig name date:date time:time band_id:integer venue_id:integer --no-test-framework

  -Genre
    -has_many :bands

      -name:string

    -rails g resource Genre name --no-test-framework
