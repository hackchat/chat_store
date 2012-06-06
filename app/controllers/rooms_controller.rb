class RoomsController < ApplicationController
  before_filter :find_room

  def create
    Room.create(params[:room])
  end

  def update
    @room.update_attributes params[:room]
  end

  def destroy
    @room.destroy
  end

end

private

  def find_room
    @room = Room.find_by_id params[:room][:id]
  end