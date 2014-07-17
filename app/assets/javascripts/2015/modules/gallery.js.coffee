page = 1;

initMasonry = ->
  $container = $('#gallery-inner')
  min_width = 280
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: '.box'
      gutter: 0
      isAnimated: true
      columnWidth: (containerWidth) ->
        num_of_boxes = (containerWidth / min_width | 0)
        box_width = ((containerWidth  / num_of_boxes) | 0)
        box_width = containerWidth  if containerWidth < min_width

        $('.box').width box_width
        $('.large').width box_width * 2 if num_of_boxes > 1
        $('.x-large').width (if (num_of_boxes > 1) then box_width * 3 else box_width * num_of_boxes)
        box_width

getPhotos = (per_page = 5) ->
  $('.spinner').show()
  $('#load-more-items').hide()

  $.ajax
    url: '/gallery_photos/'
    data:
      page: page
      per_page: per_page

  page += 1

bindLoadMoreItemEvents = ->
  $loadMoreItemsButton = $('#load-more-items')

  $loadMoreItemsButton.bind 'click', (e) ->
    e.preventDefault()
    getPhotos()

  $loadMoreItemsButton.bind 'inview', (e, visible) ->
    if visible
      getPhotos()

$(document).ready ->
  $(".fancybox").attr('rel', 'gallery').fancybox
    closeBtn: false
    beforeLoad: ->
      @padding = 0;

    helpers:
      title:
        type: 'inside'

  initMasonry()
  photos = getPhotos()
  bindLoadMoreItemEvents()


