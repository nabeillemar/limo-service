class User < ApplicationRecord
    has_many :trips
    has_many :drivers, through: :trips 

    validates :username, presence: true
    validates :username, :email, uniqueness: true
    has_secure_password



    def self.from_omniauth(auth)
    where(username: auth.info.name).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
end 



    
end
