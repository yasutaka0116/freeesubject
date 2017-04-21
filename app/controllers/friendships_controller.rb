class FriendshipsController < ApplicationController

    def index
      @user = current_user
      @friendships = @user.friends
      render "friendship-index.js.erb"
    end

    def show
       @user = User.find(params[:id])
       render "friendship-show.js.erb"
    end

    def destroy
        @friendship = Friendship.search_with_to_id(current_user.id).search_with_from_id(params[:id])
        if @friendship.empty?
          @friendship = Friendship.search_with_to_id(params[:id]).search_with_from_id(current_user.id)
        end
        Friendship.destroy(@friendship)
        redirect_to :root
    end

    def create
      @friendship = Friendship.new(to_user_id: params[:user_id], from_user_id: current_user.id)
      @friendship.save
       redirect_to :root
    end

end
