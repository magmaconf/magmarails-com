$(document).ready ->
  $(window).scroll ->
    scrollPosition = $(@).scrollTop() + 111
    speakersPosition = $('#speakers').position()['top']
    whatIsMagmaPosition = $('#what-is-magma').position()['top']
    locationPosition = $('.location').position()['top']
    venuePosition = $('#venue').position()['top']
    culturePosition = $('#culture').position()['top']
    mapPosition = $('#location').position()['top']
    schedulePosition = $('#schedule').position()['top'] - 144
    sponsoringPosition = $('#sponsoring').position()['top']

    if 0 <= scrollPosition && scrollPosition <= speakersPosition
      console.log "main"
      $('#main-menu').removeClass()

    else if speakersPosition <= scrollPosition <= whatIsMagmaPosition
      console.log "speakers"
      $('#main-menu').removeClass().addClass('speakers')
      
    else if whatIsMagmaPosition <= scrollPosition <= locationPosition
      console.log "magma"
      $('#main-menu').removeClass().addClass('what-is-magma')
    
    else if scrollPosition >= locationPosition && scrollPosition <= venuePosition
      console.log "location #{locationPosition}"
      $('#main-menu').removeClass().addClass('location')
      
    else if venuePosition <= scrollPosition <= culturePosition
      console.log "venue"
      $('#main-menu').removeClass().addClass('venue')
    
    else if culturePosition <= scrollPosition <= mapPosition
      console.log "culture"
      $('#main-menu').removeClass().addClass('culture')

    else if mapPosition <= scrollPosition <= schedulePosition
      $('#main-menu').removeClass().addClass('map')

    else if schedulePosition <= scrollPosition <= sponsoringPosition
      $('#main-menu').removeClass().addClass('schedule')
    
    else if sponsoringPosition <= scrollPosition
      $('#main-menu').removeClass().addClass('sponsoring')