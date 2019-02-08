class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ここのparamsはapp/assets/javascripts/channels/room.coffeeの
    # App.cable.subscriptions.createの引数に渡したハッシュ部分
    message = Message.new(
                    content:          data['content'],
                    picture_data_uri: data['data_uri'],
                    room_id:          params['room_id']
              )
    message.save

    ActionCable.server.broadcast("room_channel_#{params['room_id']}", cast_data(message))
  end

  private

    def cast_data(message)
      {
        html: ApplicationController.renderer.render(
                partial: 'messages/message',
                locals: { message: message })
      }
    end
end
