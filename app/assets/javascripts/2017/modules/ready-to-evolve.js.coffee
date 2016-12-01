setMacFlyCar = ->
  if $(window).width() > 1880
    $('.reylero-macfly-extended').show()
    $('.reylero-macfly').hide()
    $('.reylero-macfly-extended').css 'width', $('.js-aside-info').width()
  else
    $('.reylero-macfly-extended').hide()
    $('.reylero-macfly').show()
  return

$(document).on 'ready', ->
  if window.location.href.match(/about/) || window.location.href.match(/ready_to_evolve/)
    setMacFlyCar()
    $(window).on 'resize', ->
      setMacFlyCar()
  else if location.pathname == '/'
    if $(window).width() > 1880
      $('.reylero-macfly-extended').show()
      $('.reylero-macfly').hide()
    else
      $('.reylero-macfly-extended').hide()
      $('.reylero-macfly').show()
    setTimeout (->
      $(window).on 'resize', ->
        setMacFlyCar()
      ), 3000
  else
    $('.reylero-macfly-extended').hide()
