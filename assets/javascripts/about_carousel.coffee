$ ->

  $('#location-carousel, #venue-carousel, #culture-carousel, #village-image').jcarousel()

  $(".controls").jcarouselPagination({
    item: (page) ->
      "<span href='##{page}'></span>"
  })

  $('.controls :first-child').addClass('active')

  setActive = (selector)->
    $("#{selector} span").on 'click', ->
      $("#{selector} span").removeClass('active')
      $(this).addClass('active')

  controls = ['#location', '#venue', '#culture', '#village-info']

  for control in controls
    setActive(control)
