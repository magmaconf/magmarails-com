$ ->

  $('#location-carousel, #venue-carousel, #culture-carousel, #magma-village-carousel').jcarousel()

  $(".controls").jcarouselPagination({
    item: (page) ->
      "<span href='##{page}'></span>"
  })

  $('.controls :first-child').addClass('active')

  setActive = (selector)->
    $("#{selector} span").on 'click', ->
      $("#{selector} span").removeClass('active')
      $(this).addClass('active')

  controls = ['#location', '#venue', '#culture', '#magma-village']

  for control in controls
    setActive(control)
