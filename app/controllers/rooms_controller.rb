class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @messages = @room.messages
    @new_message = @messages&.build(room: @room)
  end

  def create
    @new_room = Room.new(title: params[:title])

    if @new_room.save
      @new_room.broadcast_append_to :rooms
    else
      @errors = @new_message.errors
    end
  end
end