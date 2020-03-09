folk = Genre.create(
  name: "Folk"
)

tophat = Venue.create(
  name: "Top Hat",
  email: "booking@tophat.com",
  description: "Beautiful lounge in Missoula, Montana"
)

npr = Band.create(
  name: "National Park Radio",
  email: "booking@nationalparkradio.com",
  genre: folk,
  description: "A modern folk band based in Arkansas."
)

riley = User.create(
  name: "Riley",
  email: "slaydenriley@gmail.com",
  password_digest: "codydog",
  description: "Hey, my name is Riley and I play banjo for National Park Radio"
)

newgig = Gig.create(
  name: "A night with National Park Radio",
  date: "2020-03-21 18:00:00",
  band: npr,
  venue: tophat
)

wilma = Venue.create(
  name: "Wilma Theatre",
  email: "booking@thewilma.com",
  description: "Music theatre in Missoula Montana"
)

nextgig = Gig.create(
  name: "NPR @ The Wilma",
  date: "2020-05-22 21:00:00",
  band: npr,
  venue: wilma
)

riley.bands = npr
