---
---
$ ->
  getScroll()
  autosize $('textarea')
  $("#mb-nav a").click ->
    $('#collapseMenu').collapse('hide')
    getScroll()

  $(window).on 'scroll', ->
    elementPosFromTop = $("#bottom").position().top
    elementHeight = $('#bottom').innerHeight()
    elementStart = elementPosFromTop - (elementHeight*2)
    scrollPos = $(window).scrollTop()
    if elementStart < scrollPos
      $('.credits').fadeIn()
    else
      $('.credits').fadeOut('fast')
    getScroll()


getScroll = ->
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
