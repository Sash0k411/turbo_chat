class MessagesController < ApplicationController
  def create
    @new_message = Message.new(strong_params)

    if @new_message.save
      room = @new_message.room
      @new_message.broadcast_append_to room, target: "room_#{room.id}_messages"
    else
      redirect_to :back, flash.alert = 'Message empty.'
    end
  end

  private

  def strong_params
    params.require(:message).permit(:body, :room_id)
  end
end