$(document).ready ->

  pathname = location.pathname

  addActiveClass = (element) ->
    $(element).addClass('active')

  if pathname is '/'
    $('#main-menu').addClass('index')
    $('#mobile-header').addClass('index')
    $('#footer').addClass('index')

  else if pathname is '/speakers'
    $('#main-menu').addClass('speakers')
    $('#mobile-header').addClass('speakers')
    addActiveClass('#speakers-link')

  else if pathname is '/about-magma'
    $('#main-menu').addClass('about-magma')
    $('#mobile-header').addClass('about-magma')
    addActiveClass('#about-magma-link')
    $('#footer').addClass('about-magma')

  else if pathname is '/accommodations'
    $('#main-menu').addClass('accommodations')
    $('#mobile-header').addClass('accommodations')
    addActiveClass('#accommodations-link')
    $('#footer').addClass('accommodations')

  else if pathname is '/schedule'
    $('#main-menu').addClass('schedule')
    $('#mobile-header').addClass('schedule')
    addActiveClass('#schedule-link')
    $('#footer').addClass('schedule')

  else if pathname is '/sponsors'
    $('#main-menu').addClass('sponsoring')
    $('#mobile-header').addClass('sponsoring')
    addActiveClass('#sponsors-link')


