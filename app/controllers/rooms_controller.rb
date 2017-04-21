class RoomsController < ApplicationController

    def index
      @a = Room.joins(:friendship).merge(Friendship.where(from_user_id: current_user.id))
      @b = Room.joins(:friendship).merge(Friendship.where(to_user_id: current_user.id))
      @rooms = @a+@b
      render "room-index.js.erb"
    end

    def create
      @friendship = Friendship.search_with_to_id(current_user.id).search_with_from_id(params[:id])
      if @friendship.empty?
        @friendship = Friendship.search_with_to_id(params[:id]).search_with_from_id(current_user.id)
      end
      @room = Room.new(friendship_id: @friendship.ids[0].to_i)
      @room.save
      Talk.create(room_id: @room.id, message: nil)
      redirect_to :root
    end

end
