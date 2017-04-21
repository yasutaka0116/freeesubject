module FriendshipsHelper
  def findroom(id)
    @friendship = Friendship.search_with_to_id(current_user.id).search_with_from_id(id)
      if @friendship.empty?
          @friendship = Friendship.search_with_to_id(id).search_with_from_id(current_user.id)
      end
      @room = Room.where(friendship_id: @friendship[0].id)
      if @room.empty?
        return true
      else
        return false
      end
  end
end
