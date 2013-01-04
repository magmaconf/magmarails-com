@Magma ||= {}

class Magma.home

  constructor: ->
    @init_slide_sizes()
    @init_unmask()
    @init_navigation()
    @init_rotation_event()
    @init_mobile_menu()

  init_slide_sizes: () ->
    width = $(window).width()

  init_rotation_event: () ->
    $(window).bind 'orientationchange', () ->
      window.location.reload()

  init_unmask: () ->
    $(window).scroll =>
      if $(window).scrollTop() > 10 and  $(window).width() < 700   then $('.main-nav').hide('slow')
      val = 880
      if navigator.platform == 'iPad' then val = 470
      if $(window).scrollTop() > val && $('.active').hasClass 'mask'
        @color_transition('remove-mask')
        $('#slider.mask').removeClass 'mask'
        $('#unmask').animate
          right: "#{$(window).width() + 590}px"
          display: 'none'
        ,
          duration: 4000
          step: (now, fx) ->
            val = 360
            if parseInt(now) > val
              $('.slide .img-gray').animate
                opacity: 0
              , 1000
              $('.slide .img-color').animate
                opacity: 1
              , 1000

              $('.slide').removeClass('mask')


  init_mobile_menu: () ->
    $('.mobile-menu').live 'click', (e) ->
      $('.main-nav').show('slow');

  init_navigation: () ->
    $('.main-nav a').on 'click', (e) =>
      e.preventDefault()
      action = $(e.currentTarget).data('action')
      @color_transition action
      remove_id = $('.active').attr('id')
      console.log $("##{remove_id}").first()
      $("##{remove_id}").stop().animate
        opacity: 0
      ,
        duration: 500
        step: (now, fx) =>
          if parseInt(now) > -1360
            if $(window).scrollTop() > 0 then $(window).scrollTop 0
            $("##{remove_id}").removeClass 'active'
            $("##{action}").addClass 'active'
            @items_transition action
            $("##{action}").stop().animate
              opacity: 1
            ,
              duration: 500

  items_transition: (action) ->
    switch action
      when "home" then @load_home()
      when "call-for-papers" then @load_cfp()
      when "keynotes" then @load_keynotes()


  load_home: () ->
    $('#slider').removeClass()
    $('.home').addClass('active')
    $('#slider').addClass('home')
    $(document).attr('title', 'Magma Conf');


  load_cfp: () ->
    $('#slider').removeClass()
    $('.call-for-papers').addClass('active')
    $('#slider').addClass('call-for-papers')
    $(document).attr('title', 'Magma Conf - Call for Papers');

    $('.container').animate
      opacity: 1;
    ,
      duration: 500

  load_keynotes: () ->
    $('#slider').removeClass()
    $('.keynotes').addClass('active')
    $('#slider').addClass('keynotes')
    $(document).attr('title', 'Magma Conf - Keynotes')

    $('.container').animate
      opacity: 1;
    ,
      duration: 500


  color_transition: (section_name) ->

    switch section_name
      when "remove-mask" then $('#slider').animate({backgroundColor: "#a2cebd"}, {queue: false, duration: 'fast'})
      when "home" then $('#slider').animate({backgroundColor: "#a2cebd"}, {queue: false, duration: 'fast'})
      when "call-for-papers" then $('#slider').animate({backgroundColor: "#84171a"}, {queue: false, duration: 'fast'})
      when "keynotes" then $('#slider').animate({backgroundColor: "#e2a63c"}, {queue: false, duration: 'fast'})




