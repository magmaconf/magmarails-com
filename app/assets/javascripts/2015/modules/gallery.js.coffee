class @Gallery
  constructor: (container) ->
    @container = $(container)

  page: 1

  initMasonry: ->
    min_width = 280
    @container.imagesLoaded =>
      @container.masonry
        itemSelector: '.gallery-box'
        gutter: 0
        columnWidth: (containerWidth) ->
          num_of_boxes = (containerWidth / min_width | 0)
          box_width = ((containerWidth  / num_of_boxes) | 0)
          box_width = containerWidth  if containerWidth < min_width

          $('.gallery-box').width box_width
          $('.large').width box_width * 2 if num_of_boxes > 1
          $('.x-large').width (if (num_of_boxes > 1) then box_width * 3 else box_width * num_of_boxes)
          box_width

  setPhotos: (per_page = 16) ->
    $.ajax(
      url: '/gallery_photos/'
      data:
        page: @page
        per_page: per_page
        flickr: true
    ).done =>
      $('.js-hide').css('width', 0)
      $('#main-section').css('right', '0%')
    @page += 1

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

