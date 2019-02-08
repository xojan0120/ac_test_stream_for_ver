# -----------------------------------------------------------------------------------------------------------------------------
# セレクタ定義
# -----------------------------------------------------------------------------------------------------------------------------
other_channel_selector = '[data-otherChannel]'

# -----------------------------------------------------------------------------------------------------------------------------
# 関数定義
# -----------------------------------------------------------------------------------------------------------------------------
create_subscriptions = (params) ->
  # クライアント側でApp.cable.subscriptions.createが呼ばれると
  # サーバのチャンネルと通信が始まる？
  # paramsはapp/channels/other_channel.rbに渡される。
  # params内のchannelキーの値は、呼び出すapp/channels/other_channel.rbの
  # クラス名と同じでなければいけない。
  App.other = App.cable.subscriptions.create (params),
    connected: ->
      # Called when the subscription is ready for use on the server
  
    disconnected: ->
      # Called when the subscription has been terminated by the server
  
    received: (data) ->
      alert(data['html'])
  
    something: ->
      @perform 'something'

# -----------------------------------------------------------------------------------------------------------------------------
# イベント定義
# -----------------------------------------------------------------------------------------------------------------------------
# channels_other_create_subscriptionsはapp/views/show.html.slimの
# 下部のtriggerメソッド用のカスタムイベントである。
# show.html.slimが読み込まれたらcreate_subscriptionsする。
$(document).on 'channels_other_create_subscriptions', ->
  create_subscriptions({ channel: "OtherChannel" })

# -----------------------------------------------------------------------------------------------------------------------------
# イベント関数
# -----------------------------------------------------------------------------------------------------------------------------
$(document).on 'click', other_channel_selector, (event) ->
  App.other.something()
  return
