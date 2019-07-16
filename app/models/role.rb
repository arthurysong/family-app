class Role < ActiveRecord::Base
    belongs_to :user
    belongs_to :family
    validates :user_id, :uniqueness => {:scope => :family_id}
end