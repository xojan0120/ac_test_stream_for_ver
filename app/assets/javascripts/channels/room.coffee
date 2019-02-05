App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').prepend data['message_html']

  speak: (content, data_uri, file_name) ->
    @perform 'speak', { content: content, data_uri: data_uri, file_name: file_name }
    clear_form '#test_form'

clear_form = (selector) ->
  $(selector).find(":text, :file").val("")

$(document).on 'keypress', '#content', (event) ->
  if event.which is 13
    content = $.trim($("#content").val())
    has_content = if content.length > 0 then true else false

    picture = $('#picture')
    has_picture = if picture.get(0).files.length > 0 then true else false

    if has_content or has_picture
      if has_picture
        file_name = picture.get(0).files[0].name
        reader = new FileReader()
        reader.readAsDataURL picture.get(0).files[0]
        reader.addEventListener "loadend", ->
          App.room.speak content, reader.result, file_name
      else
          App.room.speak content

    event.preventDefault()
