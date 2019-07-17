class Tag < ActiveRecord::Base
    belongs_to :board
    belongs_to :user

    def full_name_of_creator

        first_name = self.user.first_name
        last_name = self.board.family.last_name
        first_name + " " + last_name
    end
end