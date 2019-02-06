class RoomChannel < ApplicationCable::Channel
  def subscribed
    # paramsはapp/assets/javascripts/channels/room.coffeeの
    # App.cable.subscriptions.create { channel: "RoomChannel", room_id: room_id }
    # のハッシュ部分
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(
                    content:          data['content'],
                    picture_data_uri: data['data_uri'],
                    room_id:          params['room_id']
              )
    message.save
  end

  def something
    #ActionCable.server.broadcast("room_channel_#{params['room_id']}", { message_html: '<div>ほげ</div>' })
    ActionCable.server.broadcast("hoge_channel", { message_html: '<div>ほげ</div>' })
  end
end
