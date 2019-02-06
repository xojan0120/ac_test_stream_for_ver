# -----------------------------------------------------------------------------------------------------------------------------
# App.other
# -----------------------------------------------------------------------------------------------------------------------------
App.other = App.cable.subscriptions.create "OtherChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert(data['key'])

  something: ->
    @perform 'something'

# -----------------------------------------------------------------------------------------------------------------------------
# イベント関数
# -----------------------------------------------------------------------------------------------------------------------------
$(document).on 'click', '#something_button', (event) ->
  App.other.something()
