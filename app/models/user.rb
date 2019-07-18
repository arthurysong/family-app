class User < ActiveRecord::Base
    has_many :roles
    has_many :families, through: :roles

    has_secure_password
    validates :email, presence: true
    validates :first_name, presence: true
    validates :email, uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash["info"]["email"]
        if user = User.find_by(:email => oauth_email)
            return user
        else
            user = User.create(:email => oauth_email, :password => SecureRandom.hex)
        end
    end

    def self.parents_for_this_family(family)
        self.joins(:roles).where(roles: { title: ["Mom", "Dad"] }).where(roles: { family_id: family.id })
    end

    def my_role_in_this_family(family)
        Role.find_by(user_id: self.id, family_id: family.id)
    end

    def parent_of_this_family?(family)
        User.parents_for_this_family(family).include?(self)
    end

    def create_tag_for_this_familys_board(family, content)
        tag = Tag.new(content: content)
        tag.board = family.board
        tag.user = self
        tag.save
    end
end