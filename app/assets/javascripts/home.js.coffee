@Magma ||= {}

class Magma.home

  constructor: ->
    @init_slide_sizes()
    @init_unmask()

  init_slide_sizes: () ->
    width = $(window).width()

  init_unmask: () ->
    $(window).scroll =>
      if $(window).scrollTop() > 880
        @color_transition('remove-mask')
        $('#unmask').animate
          right: "#{$(window).width() + 590}px"
          display: 'none'
        ,
          duration: 4000
          step: (now, fx) ->
            if parseInt(now) > 360
              console.log now
              console.log 'aqui'
              $('.slide .img-gray').animate
                opacity: 0
              , 1000
              $('.color .img-color').animate
                opacity: 1
              , 1000

              $('.slide').removeClass('mask')



  color_transition: (section_name) ->
    console.log 'aa'
    switch section_name
      when "remove-mask" then $('.slide').animate({backgroundColor: "#a2cebd"}, {queue: false, duration: 'fast'})
      when "home" then $('.slide').animate({backgroundColor: "#a2cebd"}, {queue: false, duration: 'fast'})
      when "call-for-papers" then $('.slide').animate({backgroundColor: "#84171a"}, {queue: false, duration: 'fast'})
      when "keynotes" then $('.slide').animate({backgroundColor: "#e2a63c"}, {queue: false, duration: 'fast'})




