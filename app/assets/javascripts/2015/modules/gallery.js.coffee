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

getPhotos = (page = 1, per_page = 30) ->
  $.ajax
    url: '/gallery_photos/'
    data:
      page: page
      per_page: per_page

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

