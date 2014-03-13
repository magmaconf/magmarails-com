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
    $('#right.arrow').css('background-image', '')
    if $('#friday').hasClass('active')
      $('#thursday').addClass('active')
      $('#friday').removeClass('active')
    else if $('#thursday').hasClass('active')
      $('#left.arrow').css('background-image', 'none')
      $('#wednesday').addClass('active')
      $('#thursday').removeClass('active')

  $('#right.arrow').click ->
    if $('#wednesday').hasClass('active')
      $('#thursday').addClass('active')
      $('#wednesday').removeClass('active')
    else
      $('#right.arrow').css('background-image', 'none')
      $('#friday').addClass('active')
      $('#thursday').removeClass('active')

  $('#wednesday').swiperight ->
    $('#right.arrow').css('z-index', '1000')
    $(@).animate
      top: '0px'
      left: '100%'
    ,
      duration: 500
    $('#thursday').animate
      left: '14.5%'
    ,
      duration: 500


  $('#thursday').swiperight ->
    $('#right.arrow').css('z-index', '0')
    $(@).animate
      left: '100%'
    ,
      duration: 500
    $('#friday').animate
      left: '14.5%'
    ,
      duration: 500

  $('#friday').swipeleft ->
    $(@).animate
      left: '-66.3%'
    ,
      duration: 500
    $('#thursday').animate
      left: '14.5%'
    ,
      duration: 500

  $('#thursday').swipeleft ->
    $(@).animate
      left: '-66.3%'
    ,
      duration: 500
    $('#wednesday').animate
      left: '0'
    ,
      duration: 500

#  $('#schedule .container').swipeleft ->
#    $('#left.arrow').css('background-image', '')
#    if $('#wednesday').hasClass('active')
#      $('#thursday').addClass('active')
#      $('#wednesday').removeClass('active')
#    else
#      $('#right.arrow').css('background-image', 'none')
#      $('#friday').addClass('active')
#      $('#thursday').removeClass('active')
