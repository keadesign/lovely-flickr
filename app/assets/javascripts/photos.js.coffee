# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# this is coffeescript
$(document).ready ->
  $('.lightbox-bg').on 'click', ->
    $('.lightbox-box').slideUp()
    $('.lightbox-bg').fadeOut()

  $('document').on 'click', ->
    # alert "photo wuz clicked"
    $('lightbox-bg').fadeIn()

    box = $('lightbox-box').slideDown()
    box.slideDown()

    img = $(this).find('img').clone()
    box.html('')
    box.append(img)

    windowWidth = $(window).width()
    windowHeight = $(window).height()

    if img.width() > windowWidth
      newWidth = windowWidth - 50
    else
      newWidth = img.width()

    if img.height() > windowHeight
      newHeight = windowHeight - 50
    else
      newHeight = img.height()

    img.width(newWidth)
    img.height(newHeight)

    box.offset
      left: (windowWidth - newWidth) / 2
      top: (windowHeight - newHeight) /2

  $('#price_selected_id').change (evt)->
    document.querySelector("#price").textContent = evt.target.selectedOptions[0].value

# below is the same thing as the coffeescript above but in JavaScript
# $('.photo').on('click', function() {
# });


