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


  $('#schedule .js-prev-day').css('display', 'none')
  initSchedule = ->
    if $(window).width() < 568 
      $('.day_2,.day_3').removeClass 'active'
    else
      $('.day_1,.day_2,.day_3').addClass 'active'

  initSchedule();

  $(window).on 'resize', ->
    initSchedule()

  $('.js-next-day').on 'click', ->
    if $('th.active').next().length
      $('td.active').removeClass('active').next().addClass 'active'
      $('th.active').removeClass('active').next().addClass 'active'
      if $('th.active').hasClass('day_2')
        $('.js-next-day').show()
        $('.js-prev-day').show()
      else
        $('.js-next-day').hide()
        $('.js-prev-day').show()
  
  $('.js-prev-day').on 'click', ->
    if $('th.active').prev().length
      $('td.active').removeClass('active').prev().addClass 'active'
      $('th.active').removeClass('active').prev().addClass 'active'
      if $('td.active').hasClass('day_2')
        $('.js-next-day').show()
        $('.js-prev-day').show()
      else
        $('.js-next-day').show()
        $('.js-prev-day').hide()
