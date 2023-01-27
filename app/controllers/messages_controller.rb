class MessagesController < ApplicationController

  def create
    @new_message = current_user.messages.build(strong_params)

    if @new_message.save
      room = @new_message.room
      @new_message.broadcast_append_to room, target: "room_#{room.id}_messages", locals: { user: current_user }
    end
  end

  private

  def strong_params
    params.require(:message).permit(:body, :room_id)
  end

end