class TalksController < ApplicationController
   before_action :authenticate_user!, only:[:index]
  def index
    # binding.pry
  end

  def show
    @talks = Talk.where(room_id: params[:id])
    render "talk-show.js.erb"
  end

  def post
    @talk = Talk.new(create_params)
    @talk.save
    Pusher['general_channel'].trigger('chat-event', {
      message: params[:message]
    })
    render :text => 'OK', :status => 200
  end

  def create_params
    params.permit(:message, :room_id)
  end
end
