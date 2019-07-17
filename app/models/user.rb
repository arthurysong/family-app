class User < ActiveRecord::Base
    has_many :roles
    has_many :families, through: :roles

    has_secure_password
    validates :email, presence: true
    validates :first_name, presence: true
    validates :email, uniqueness: true

    def my_role_in_this_family(family)
        Role.find_by(user_id: self.id, family_id: family.id)
    end

    def self.parents_for_this_family(family)
        self.joins(:roles).where(roles: { title: ["Mom", "Dad"] }).where(roles: { family_id: family.id })
    end

    def parent_of_this_family?(family)
        User.parents_for_this_family(family).include?(self)
    end
end