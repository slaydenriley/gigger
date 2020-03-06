riley = User.create(
  name: "Riley",
  email: "slaydenriley@gmail.com",
  password_digest: "codydog"
  description: "Hey, my name is Riley and I play banjo for National Park Radio"
)

npr = Band.create(
  name: "National Park Radio",
  genre: "Folk"
  description: "A modern folk band based in Arkansas."
)

tophat = Venue.create(
  name: "Top Hat",
  email: "booking@tophat.com"
  description: "Beautiful lounge in Missoula, Montana"
)

newgig = Gig.create(
  name: "A night with National Park Radio"
  date: "03/21/2020"
  time: "6:00pm"
)

folk = Genre.create(
  name: "Folk"
)
