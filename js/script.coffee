---
---
$ ->
  $("#mb-nav a").click ->
    $('#mb-menu-modal').modal('hide')

  container = $('#video')
  iframe = $('.vimeo-video')
  scrollDown = $('.scroll-down')
  src = iframe.attr('src')
  srcAuto = iframe.attr('src') + "&autoplay=1"
  isPlaying = false
  elementPosTop = container.position().top
  viewportHeight = $(window).height()
  $(window).on 'scroll', ->
    scrollPos = $(window).scrollTop()
    elementFromTop = elementPosTop - scrollPos
    if elementFromTop > 0 and elementFromTop < elementPosTop + viewportHeight
      if !isPlaying
        isPlaying = true
        iframe.attr('src', srcAuto)
        scrollDown.fadeOut()
    else
      isPlaying = false
    return
