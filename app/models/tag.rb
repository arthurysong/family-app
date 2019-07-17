class Tag < ActiveRecord::Base
    belongs_to :board
    belongs_to :role

    def full_name_of_creator
        first_name = self.role.user.first_name
        last_name = self.role.family.last_name
        first_name + " " + last_name
    end

    def user
        self.role.user
    end
end