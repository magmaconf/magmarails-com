$ ->

  $('#location-carousel, #venue-carousel, #culture-carousel').jcarousel()

  setControls = (carousel) ->
    $("#{carousel} .controls").jcarouselPagination({
      item: (page) ->
        "<span href='##{page}'></span>"
      carousel: $("#{carousel} .content")
    })

  carousels = ['#location', '#venue', '#culture']

  for carousel in carousels
    setControls(carousel)

  $('.controls :first-child').addClass('active')

  $('#location span').on 'click', ->
    $('#location span').removeClass('active')
    $(this).addClass('active')

  $('#venue span').on 'click', ->
    $('#venue span').removeClass('active')
    $(this).addClass('active')

  $('#culture span').on 'click', ->
    $('#culture span').removeClass('active')
    $(this).addClass('active')

