$(document).ready ->

  pathname = location.pathname

  addActiveClass = (element) ->
    $(element).addClass('active')

  if pathname is '/2014'
    $('#main-menu').addClass('index')
    $('#mobile-header').addClass('index')
    $('#footer').addClass('index')

  else if pathname is '/2014/speakers'
    $('#main-menu').addClass('speakers')
    $('#mobile-header').addClass('speakers')
    addActiveClass('#speakers-link')

  else if pathname is '/2014/about'
    $('#main-menu').addClass('about-magma')
    $('#mobile-header').addClass('about-magma')
    addActiveClass('#about-magma-link')
    $('#footer').addClass('about-magma')

  else if pathname is '/2014/getting'
    $('#main-menu').addClass('getting-manzanillo')
    $('#mobile-header').addClass('getting-manzanillo')
    addActiveClass('#getting-manzanillo-link')
    addActiveClass('#getting-to-manzanillo')
    $('#footer').addClass('getting-manzanillo')

  else if pathname is '/2014/schedule'
    $('#main-menu').addClass('schedule')
    $('#mobile-header').addClass('schedule')
    addActiveClass('#schedule-link')
    $('#footer').addClass('schedule')

  else if pathname is '/2014/sponsors'
    $('#main-menu').addClass('sponsoring')
    $('#mobile-header').addClass('sponsoring')
    addActiveClass('#sponsors-link')

  else if pathname is '/2014/policies'
    $('#main-menu').addClass('policies')
    $('#mobile-header').addClass('policies')
    $('.close-popup').css('display', 'none')
