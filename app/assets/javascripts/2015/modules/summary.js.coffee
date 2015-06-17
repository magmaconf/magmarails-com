$(document).ready ->

  $(window).scroll ->

    scrollPosition = $(@).scrollTop()
    screenWidth = window.screen.width

    minScroll = 120
    maxScroll = 1500

    if screenWidth <= 640
      scrollPosition+= 31
      maxScroll = 1065

  # if minScroll <= scrollPosition <= maxScroll
  #  $('#schedule .schedule-container').addClass('fixed')
  # else
  #   $('#schedule .schedule-container').removeClass('fixed')


  $('#summary .js-prev-day').css('display', 'none')

  $('#summary .js-prev-day').click ->
    activeDay = $('#summary .active-day')
    activeDay.swiperight()

  $('#summary .js-next-day').click ->
    activeDay = $('#summary .active-day')
    activeDay.swipeleft()

  $('#summary .js-first-day').swipeleft ->
    swipeToLeft(@, '#summary .js-second-day')
    $('#summary .js-prev-day').css('display', 'block')

  $('#summary .js-second-day').swipeleft ->
    swipeToLeft(@, '#summary .js-third-day')
    $('#summary .js-next-day').css('display', 'none')

  $('#summary .js-third-day').swiperight ->
    swipeToRight(@, '#summary .js-second-day')
    $('#summary .js-next-day').css('display', 'block')

  $('#summary .js-second-day').swiperight ->
    swipeToRight(@, '#summary .js-first-day')
    $('#summary .js-prev-day').css('display', 'none')

  swipeToLeft = (hide, show) ->
    if !$(show).hasClass('activated')
      galleryId = $(show).find("div[id^='gallery']").attr('id');
      new Gallery("##{galleryId}").start();
    $(show).addClass('active-day activated').css('left', '95%')
    $(hide).removeClass('active-day')
    $(hide).animate
      left: '-100%'
    , 300
    $(show).animate
      left: '0'
    , 200

  swipeToRight = (hide, show) ->
    $(show).addClass('active-day')
    $(hide).removeClass('active-day')
    $(hide).animate
      left: '100%'
    , 300, ->
      $(hide).css('left', '-100%')
    $(show).animate
      left: '0'
    , 250
