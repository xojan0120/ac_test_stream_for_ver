class OtherChannel < ApplicationCable::Channel
  def subscribed
    stream_from "other_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def something
    ActionCable.server.broadcast("other_channel", { key: 'ほげ' })
  end
end
