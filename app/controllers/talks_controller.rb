class TalksController < ApplicationController
   before_action :authenticate_user!, only:[:index]

    def index
      @a = Room.joins(:friendship).merge(Friendship.where(from_user_id: current_user.id))
      @b = Room.joins(:friendship).merge(Friendship.where(to_user_id: current_user.id))
      @rooms = @a+@b
    end

    def show
      config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
      @pusher_access_key = config_pusher['access_key']
      @talks = Talk.where(room_id: params[:id])
      render "talk-show.js.erb"
    end

    def post
      @talk = Talk.new(create_params)
      @talk.save
      time = view_context.simple_time(@talk.created_at)
      Pusher.trigger( params[:room_id]+'_channel', 'chat_event', {
        message: params[:message], sender_id: params[:sender_id], created_at: time
      })
      render :text => 'OK', :status => 200
    end

    def create_params
      params.permit(:message, :room_id, :sender_id)
    end

end
