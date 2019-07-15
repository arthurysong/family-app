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

    def create_tag_for_this_familys_board(family, content)
        role = my_role_in_this_family(family)
        board = family.board
        if role.family == family
            tag = family.board.tags.build(content: content)
            tag.role = role
            tag.save
        end
    end
end