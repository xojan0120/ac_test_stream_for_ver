class RoomsController < ApplicationController
  def show
    @room_id = params[:room_id].to_i
    @messages = Message.where(room_id: @room_id)
  end

  def index
    @room_ids = Message.select(:room_id).distinct.pluck(:room_id).sort
  end
end
