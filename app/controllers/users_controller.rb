class UsersController < ApplicationController
    protect_from_forgery except: :show
  def index
    @users = User.all.order("name asc")
    render "user-index.js.erb"
  end

  def show
   @user = User.find(params[:id])
   render "user-show.js.erb"
  end


end
