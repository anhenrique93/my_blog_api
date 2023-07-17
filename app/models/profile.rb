class Profile < ApplicationRecord
    require "securerandom"

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :last_name, presence: true, uniqueness: false
    validates :name, presence: true
    validates :pt_description, presence: true
    validates :password, presence: true, allow_blank: true

    has_many :networks, dependent: :destroy
end
