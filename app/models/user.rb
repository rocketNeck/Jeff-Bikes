class User < ApplicationRecord

  has_many :bikes
  has_many :comments
  has_many :comments, through: :bikes

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable,  :omniauth_providers => [:facebook, :google_oauth2]

  validates :fullname, presence: true, length: {maximum: 50}

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.image = auth.info.image
      end
    end
  end

end
