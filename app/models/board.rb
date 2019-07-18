class Board < ActiveRecord::Base
    belongs_to :family
    has_many :tags
    validates :header, length: { minimum: 4 }
end