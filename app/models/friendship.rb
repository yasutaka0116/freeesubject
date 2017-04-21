class Friendship < ActiveRecord::Base
  belongs_to :from_user, :class_name => 'User'
  belongs_to :to_user, :class_name => 'User'
  has_one :room, dependent: :destroy
   scope :search_with_from_id, ->(id) { where(from_user_id: id) }
   scope :search_with_to_id, ->(id) { where(to_user_id: id) }

end
