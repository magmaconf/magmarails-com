class @Gallery
  #72157645528624066 is default flicker photoSet
  constructor: (container, photoSet = '72157676573305506') ->
    @container = $(container)
    @containerSelector = container
    @photoSet = photoSet

  page: 1

  initMasonry: ->
    min_width = 280
    @container.imagesLoaded =>
      @container.masonry
        itemSelector: @getNestedSelector('.gallery-box')
        gutter: 0
        columnWidth: (containerWidth) =>
          num_of_boxes = (containerWidth / min_width | 0)
          box_width = ((containerWidth  / num_of_boxes) | 0)
          box_width = containerWidth  if containerWidth < min_width

          $(@getNestedSelector('.gallery-box')).width box_width
          $(@getNestedSelector('.large')).width box_width * 2 if num_of_boxes > 1
          $(@getNestedSelector('.x-large')).width (if (num_of_boxes > 1) then box_width * 3 else box_width * num_of_boxes)
          box_width

  getNestedSelector: (selector) ->
    return "#{@containerSelector} #{selector}"

  setPhotos: (per_page = 16) ->
    $.ajax(
      url: '/gallery_photos/'
      data:
        page: @page
        per_page: per_page
        flickr: true
        container: @containerSelector
        photo_set: @photoSet
    ).done =>
      $('#main-section').css('right', '0%')
      $('.magma-info').addClass('js-width-transition')
      $('.magma-info').removeClass('js-full-width')


    @page += 1
  setGalleryHeight: ->
    setTimeout (->
      $('#photo-gallery').css 'height', ($('.magma-info').height() - $(".nav-menu").height()) + 15
    ), 2000
    $(window).on 'resize', ->
      $('#photo-gallery').css 'height', ($('.magma-info').height() - $(".nav-menu").height()) + 15

  bindLoadMoreItemEvents: ->
    $loadMoreItemsButton = $('#load-more-items')
    $loadMoreItemsButton.bind 'click', (e) =>
      e.preventDefault()
      @setPhotos()
    $loadMoreItemsButton.bind 'inview', (e, visible) =>
      if visible
        @setPhotos()

  bindShareWithFacebookEvents: ->
    $('body').on 'click', '.share-via-facebook', (e) ->
      e.preventDefault()
      id = $(@).data('photo')
      url = 'https://www.flickr.com/photos/crowdint/' + id
      FB.ui(
          method: 'feed',
          link: url
        ,(response) -> )

  initFancyBox: ->
    $(".fancybox").attr('rel', 'gallery').fancybox
      closeBtn: false
      beforeLoad: ->
        @padding = 0;
        @title = $(@element).siblings('.desc').html()
      helpers:
        title:
          type: 'inside'
      tpl:
        next: '<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><div class="gallery-next"><div class="nav-arrow arrow-right"></div></div></a>'
        prev: '<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><div class="gallery-prev"><div class="nav-arrow arrow-left"></div></div></a>'

  start: ->
    @initFancyBox()
    @initMasonry()
    @setPhotos()
    @bindLoadMoreItemEvents()
    @bindShareWithFacebookEvents()
    @setGalleryHeight()
