class Room < ActiveRecord::Base
    belongs_to :friendship
    has_many :talks
end
