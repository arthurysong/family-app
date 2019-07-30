class Family < ActiveRecord::Base
    has_many :roles
    has_many :users, through: :roles
    has_secure_password :validations => false
    has_one :board
    validates :last_name, presence: true
    scope :largest_family, ->{ joins(:roles).group('families.id').order('COUNT(families.id) DESC').first }
    
    def self.largest_family_from_iteration
        families_count = self.all.collect { |family| 
            family.roles.count
        }
        largest_number_of_people = families_count.max
        largest_family = self.all.find { |family| family.roles.count == largest_number_of_people }
    end
end