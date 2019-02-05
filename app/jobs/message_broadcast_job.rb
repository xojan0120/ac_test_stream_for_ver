class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast('room_channel', cast_data(message))
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
