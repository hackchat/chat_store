class MessagesController < ApplicationController
  def index
    @messages = Message.find_all_by_room_id(params[:room_id])
    render json: @messages, status: :ok
  end
end
