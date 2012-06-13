class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.includes(:messages).find(params[:id])
  end

end