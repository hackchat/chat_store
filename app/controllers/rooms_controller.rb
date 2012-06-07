class RoomsController < ApplicationController

  # def create
  #   Room.create(params[:room])
  # end

  # def update
  #   @room.update_attributes params[:room]
  # end

  # def destroy
  #   @room.destroy
  # end

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.includes(:messages).find(params[:id])
  end

end