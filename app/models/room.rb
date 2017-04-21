class Room < ActiveRecord::Base
    belongs_to :friendship
    has_many :talks, dependent: :destroy
end
