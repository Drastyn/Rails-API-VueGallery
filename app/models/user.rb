class User < ApplicationRecord
    has_secure_password

    has_many :archives, foreign_key: "users_id"

    validates :name, :password, presence: true
    validates :name, uniqueness: true
end
