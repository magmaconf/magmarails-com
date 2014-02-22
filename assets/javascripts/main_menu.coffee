$(document).ready ->

  pathname = location.pathname

  addActiveClass = (element) ->
    $(element).addClass('active')

  if pathname == '/'
    $('#main-menu').addClass('index')

  else if pathname == '/speakers'
    $('#main-menu').addClass('speakers')
    addActiveClass('#speakers-link')

  else if pathname == '/about-magma'
    $('#main-menu').addClass('about-magma')
    addActiveClass('#about-magma-link')

  else if pathname == '/accommodations'
    $('#main-menu').addClass('accommodations')
    addActiveClass('#accommodations-link')

  else if pathname == '/schedule'
    $('#main-menu').addClass('schedule')
    addActiveClass('#schedule-link')

  else if pathname == '/sponsors'
    $('#main-menu').addClass('sponsoring')
    addActiveClass('#sponsors-link')


