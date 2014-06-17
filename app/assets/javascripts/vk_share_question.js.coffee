$(document).on 'page:change', ->

  places = $ '.vk_share_button_place:not(.already)'

  return if places.length == 0

  places.each ->
    place = $ this
    info = JSON.parse place.html()

    place
    .html VK.Share.button.apply VK.Share, info
    .addClass 'already'
    return

  return
