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
  description: "Hey, my name is Riley and I play banjo for National Park Radio",
  band: npr
)

newgig = Gig.create(
  name: "A night with National Park Radio",
  date: "2020-03-21 18:00:00",
  band: npr,
  venue: tophat
)
