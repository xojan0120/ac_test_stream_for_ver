class RoomChannel < ApplicationCable::Channel
  def subscribed
    # ストリームをチャンネル名ではなく、モデルに紐付けるには
    # stream_forを使用する
    #stream_from "room_channel_#{params['room_id']}"
    stream_for Room.find(params['room_id'])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ここのparamsはapp/assets/javascripts/channels/room.coffeeの
    # App.cable.subscriptions.createの引数に渡したハッシュ部分

    if room = Room.find(params['room_id'])
      message = Message.new(
                      content:          data['content'],
                      picture_data_uri: data['data_uri'],
                      room:             room
                )
      message.save
      # ストリームをモデルに紐づけた場合は、下記のように
      # 作成したチャンネル用のクラスのbroadcast_toメソッドを使用する。
      #ActionCable.server.broadcast("room_channel_#{params['room_id']}", cast_data(message))
      RoomChannel.broadcast_to(room, cast_data(message))
    end
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
