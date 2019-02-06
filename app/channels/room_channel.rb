class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # ここのroom_idは、app/channels/application_cable/connection.rbの
    # connectメソッドで設定している。
    stream_for room_id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(
                    content:          data['content'],
                    picture_data_uri: data['data_uri'],
                    room_id:          room_id
              )
    message.save
  end
end
