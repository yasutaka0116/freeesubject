module UsersHelper
  def friendship_method(id)
      @friendship = Friendship.search_with_to_id(current_user.id).search_with_from_id(id)
      if @friendship.empty?
        @friendship = Friendship.search_with_to_id(id).search_with_from_id(current_user.id)
      end
      if @friendship.empty?
        return true
      else
      return false
      end
  end
end
