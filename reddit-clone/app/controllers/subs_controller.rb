class SubsController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    render :index
  end

  def show
    render :show
  end

  def new
    # @user = User.find_by(id: current_user.id)
    render :new
  end

  def create
    @sub = Sub.new(params.require(:title, :description)
    @sub.save
  end
  
end