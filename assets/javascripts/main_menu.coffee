$(document).ready ->
  $('#main-menu a').smoothScroll({offset: -58, exclude: ['#schedule-link', '#accommodations-link']});
  $('#schedule-link').smoothScroll({offset: 125});
  $('#accommodations-link').smoothScroll({offset: 10})

  $('span#magma-logo').click ->
    $.smoothScroll ->
      scrollElement: $('body'),
      scrollTarget: '#main-section'
    return false;

  $(window).scroll ->
    scrollPosition = $(@).scrollTop() + 111
    speakersPosition = $('#speakers').position()['top']
    whatIsMagmaPosition = $('#what-is-magma').position()['top']
    accommodationsPosition = $('#accommodations').position()['top']
    schedulePosition = $('#schedule').position()['top'] - 144
    sponsoringPosition = $('#sponsoring').position()['top']

    if 0 <= scrollPosition && scrollPosition <= speakersPosition
      $('#main-menu').removeClass()
      $('#main-menu a').removeClass('active')

    else if speakersPosition <= scrollPosition <= whatIsMagmaPosition
      $('#main-menu').removeClass().addClass('speakers')
      addActiveClass('#speakers-link')

    else if whatIsMagmaPosition <= scrollPosition <= accommodationsPosition
      $('#main-menu').removeClass().addClass('what-is-magma')
      addActiveClass('#what-is-magma-link')

    else if accommodationsPosition <= scrollPosition <= schedulePosition
      $('#main-menu').removeClass().addClass('accommodations')
      addActiveClass('#accommodations-link')

    else if schedulePosition <= scrollPosition <= sponsoringPosition
      $('#main-menu').removeClass().addClass('schedule')
      addActiveClass('#schedule-link')

    else if sponsoringPosition <= scrollPosition
      $('#main-menu').removeClass().addClass('sponsoring')
      addActiveClass('#sponsors-link')


  addActiveClass = (element) ->
    $('#main-menu a').removeClass('active')
    $(element).addClass('active')