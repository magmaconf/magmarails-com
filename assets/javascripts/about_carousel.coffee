$ ->
  $('.jcarousel').jcarousel()

  $('span').on 'click', ->
    $('.jcarousel').jcarousel('scroll', $(this).data('target'))

