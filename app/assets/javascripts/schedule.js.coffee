$(document).ready ->

  $(window).scroll ->

    scrollPosition = $(@).scrollTop()
    screenWidth = window.screen.width

    minScroll = 163
    maxScroll = 1372

    if screenWidth <= 640
      scrollPosition+= 31
      maxScroll = 1065

    if minScroll <= scrollPosition <= maxScroll
      $('#schedule .container').addClass('fixed')
    else
      $('#schedule .container').removeClass('fixed')


  $('#left.arrow').css('background-image', 'none')

  $('#left.arrow').click ->
    activeDay = $('#schedule [class$=active]')
    activeDay.swiperight()

  $('#right.arrow').click ->
    activeDay = $('#schedule [class$=active]')
    activeDay.swipeleft()

  $('#wednesday').swipeleft ->
    swipeToLeft(@, '#thursday')
    $('#left.arrow').css('background-image', '')

  $('#thursday').swipeleft ->
    swipeToLeft(@, '#friday'  )
    $('#right.arrow').css('background-image', 'none')

  $('#friday').swiperight ->
    swipeToRight(@, '#thursday')
    $('#right.arrow').css('background-image', '')

  $('#thursday').swiperight ->
    swipeToRight(@, '#wednesday')
    $('#left.arrow').css('background-image', 'none')

  swipeToLeft = (hide, show) ->
    $(show).addClass('active').css('left', '95%')
    $(hide).removeClass('active')
    $(hide).animate
      left: '-70%'
    ,300
    $(show).animate
      left: '14.5%'
    ,200

  swipeToRight = (hide, show) ->
    $(show).addClass('active')
    $(hide).removeClass('active')
    $(hide).animate
      left: '100%'
    ,300, ->
      $(hide).css('left', '-100%')
    $(show).animate
      left: if show is '#wednesday' then '0' else '14.5%'
    ,250