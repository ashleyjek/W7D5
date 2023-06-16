class SubsController < ApplicationController
    before_action :require_logged_in, only: [:index, :show, :new, :create]
  def index
    @user = User.find_by(session_token: session[:session_token])
    @subs = Sub.all
    render :index
  end

  def new
    @user = User.find_by(id: current_user.id)
    render :new
  end

  def create
    @sub = Sub.new(params.require(:sub).permit(:title, :description))
    @sub.moderater_id = current_user.id
    if @sub.save
        redirect_to subs_url
    else
        flash[:errors] = @sub.errors.full_messages
        redirect_to new_sub_url
    end
  end
  
end