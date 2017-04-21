module RoomsHelper
    def finduser(id)
      @room = Room.find(id)
      @friendship = Friendship.find(@room.friendship_id)
      if @friendship.from_user_id == current_user.id
          @user = User.find(@friendship.to_user_id )
      else
          @user = User.find(@friendship.from_user_id )
      end
      return @user
    end
end
