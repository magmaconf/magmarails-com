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
    $('#left.arrow').css('background-image', '')
    if $('#wednesday').hasClass('active')
      $('#thursday').addClass('active')
      $('#wednesday').removeClass('active')
    else
      $('#right.arrow').css('background-image', 'none')
      $('#friday').addClass('active')
      $('#thursday').removeClass('active')