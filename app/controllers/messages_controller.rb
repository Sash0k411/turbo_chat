class MessagesController < ApplicationController

  def create
    if Message.present?
      @new_message = Message.new(strong_params)

      if @new_message.save
        room = @new_message.room
        @new_message.broadcast_append_to room, target: "room_#{room.id}_messages"
      end
    end
  end

  private

  def strong_params
    params.require(:message).permit(:body, :room_id)
  end

end