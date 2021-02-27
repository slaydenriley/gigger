User.destroy_all
Band.destroy_all
Venue.destroy_all
Genre.destroy_all
BandUser.destroy_all

def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

riley = User.create(
  name: "Riley Slayden",
  email: "montanabanjo@gmail.com",
  password: "codydog",
  description: "", account_type: "band_member",
  admin: true, uid: "215233163685593",
  provider: "facebook",
  image: "https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg"
)

riley.save!

folk = Genre.create(
  name: "Folk"
)

folk.save

npr = Band.create(
  name: "National Park Radio",
  description: "Emotional, gut-wrenching, but still incredibly hopeful, National Park Radio’s music reverberates important themes about life, love, and difficult choices, all while echoing the enduring beauty of the band’s deep-seated roots in the Ozark Mountains.",
  genre_id: folk.id,
  email: "npr@gmail.com",
  image_link: "https://wehco.media.clients.ellingtoncms.com/imports/adg/photos/195575333_NPR-Funny-Group-2019_ORIG_t800.jpg?90232451fbcadccc64a17de7521d859a8f88077d"
)

npr.save

riley.bands << npr


Venue.create!([
  {name: "Top Hat", description: "Beautiful lounge in Missoula, Montana", email: "booking@tophat.com", image_link: "https://s3-media0.fl.yelpcdn.com/bphoto/1Totc4RdaCmcph2N4I52KA/l.jpg"},
  {name: "Wilma Theatre", description: "Music theatre in Missoula Montana", email: "booking@thewilma.com", image_link: "https://bloximages.chicago2.vip.townnews.com/missoulian.com/content/tncms/assets/v3/editorial/3/ef/3ef0690c-186f-11e6-8b57-7feec7d33dce/50c269bdeb1e8.image.jpg"}
])
