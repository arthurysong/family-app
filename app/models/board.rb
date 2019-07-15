class Board < ActiveRecord::Base
    belongs_to :family
    has_many :tags


end