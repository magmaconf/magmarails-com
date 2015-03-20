$(document).ready ->

  pathname = location.pathname

  addPageClass = (element, includeInFooter) ->
    $('#main-menu').addClass(element)
    $('#mobile-header').addClass(element)
    $('#footer').addClass(element) if includeInFooter

  addActiveClass = (element) ->
    $(element).addClass('active')

  switch pathname
    when '/2015'
      addPageClass('index', true)

    when '/2015/speakers'
      addPageClass('speakers')
      addActiveClass('#speakers-link')

    when '/2015/about'
      addPageClass('about-magma', true)
      addActiveClass('#about-magma-link')

    when '/2015/getting'
      addPageClass('getting-manzanillo', true)
      addActiveClass('#getting-manzanillo-link, #getting-to-manzanillo')

    when '/2015/schedule'
      addPageClass('schedule', true)
      addActiveClass('#schedule-link')

    when '/2015/sponsors'
      addPageClass('sponsoring')
      addActiveClass('#sponsors-link')

    when '/2015/policies'
      addPageClass('policies')
      $('.close-popup').css('display', 'none')
