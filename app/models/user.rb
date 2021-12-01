class User < ApplicationRecord
    has_many :trips
    has_many :drivers, through: :trips 

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    has_secure_password


    
end
