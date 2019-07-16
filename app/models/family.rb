class Family < ActiveRecord::Base
    has_many :roles
    has_many :users, through: :roles
    has_secure_password :validations => false
    has_one :board
    validates :last_name, presence: true
end