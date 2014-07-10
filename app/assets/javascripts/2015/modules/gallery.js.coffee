init_masonry = ->
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

$(document).ready ->
  init_masonry()
