# -----------------------------------------------------------------------------------------------------------------------------
# ロードイベント関数
# -----------------------------------------------------------------------------------------------------------------------------
$(document).on 'turbolinks:load', ->
  room_id = $('#test_form').data("room-id")

  # -----------------------------------------------------------------------------------------------------------------------------
  # App.room
  # -----------------------------------------------------------------------------------------------------------------------------
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: room_id },
    connected: ->
      # Called when the subscription is ready for use on the server
  
    disconnected: ->
      # Called when the subscription has been terminated by the server
  
    received: (data) ->
      $('#messages').prepend(data['message_html'])
  
    speak: (content, data_uri, file_name) ->
      @perform('speak', { content: content, data_uri: data_uri, file_name: file_name })
      clear_form('#test_form')

# -----------------------------------------------------------------------------------------------------------------------------
# 関数
# -----------------------------------------------------------------------------------------------------------------------------
clear_form = (selector) ->
  $(selector).find(":text, :file").val("")
  return

get_reader = (file) ->
  reader = new FileReader()
  reader.readAsDataURL(file)
  return reader

# -----------------------------------------------------------------------------------------------------------------------------
# イベント関数
# -----------------------------------------------------------------------------------------------------------------------------
$(document).on 'keypress', '#content', (event) ->
  if event.which is 13
    content = $.trim($("#content").val())
    picture = $('#picture').get(0).files[0]

    has_content = if content.length   >  0          then true else false
    has_picture = if typeof(picture) != 'undefined' then true else false

    if has_content || has_picture
      if has_picture
        file_name = picture.name
        reader    = get_reader(picture)
        reader.addEventListener "loadend", ->
          App.room.speak(content, reader.result, file_name)
      else
          App.room.speak(content)

    event.preventDefault()
