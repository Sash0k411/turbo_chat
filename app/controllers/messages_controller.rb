class MessagesController < ApplicationController
  def create
    @new_message = Message.new(message_params)

    if @new_message.save
      @new_message.broadcast_append_to @new_message.room, target: @new_message.room.channel_id
    else
      @errors = @new_message.errors.any?
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :room_id)
  end
end