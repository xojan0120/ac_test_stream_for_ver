class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("room_channel_#{message.room_id}", cast_data(message))
  end

  private

    def cast_data(message)
      { 
        message_html:
        ApplicationController.renderer.render(
          partial: 'messages/message',
          locals: { message: message }
        )
      }
    end
end
