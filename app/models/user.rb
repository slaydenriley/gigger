class User < ApplicationRecord
  has_many :band_users
  has_many :bands, through: :band_users

  has_many :venue_users
  has_many :venues, through: :venue_users

  has_many :gigs, through: :bands
  has_many :genres, through: :bands
  accepts_nested_attributes_for :bands
  accepts_nested_attributes_for :venues

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password,
    presence: true,
    confirmation: true,
    :length => {:within => 6..40}
    
  has_secure_password

  def self.create_with_omniauth(auth)

    @user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    @user.email = auth[:info][:email]
    @user.password = SecureRandom.hex
    @user.name = auth['info']['name']
    @user.image = auth['info']['image']
    if User.exists?(@user.id)
      @user
    else
      @user.save
    end
  end
end
