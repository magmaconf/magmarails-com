setMacFlyCar = ->
  console.log('algo')
  if $(window).width() > 1880
    $('.reylero-macfly-extended').show()
    $('.reylero-macfly').hide()
    $('.reylero-macfly-extended').css 'width', $('.js-aside-info').width()
  else
    $('.reylero-macfly-extended').hide()
    $('.reylero-macfly').show()
  return

$(document).on 'ready', ->
  setMacFlyCar()
  $(window).on 'resize', ->
    setMacFlyCar()
    return
  return
