$(document).ready ->

  $('#newsletter-form').submit (ev) ->
    ev.preventDefault()

    if $(@).valid()
      $.ajax
        url: "/newsletter"
        type: 'post'
        data: $(@).serialize()
        success: () ->
          clearFormFields()
          showSuccessMessage()
        error: () ->
          showErrorMessage()


  $('#newsletter-form').validate
    rules:
      name: 'required'
      email:
        required: true
        email: true

  showSuccessMessage = ->
    $('#message-box span').text('Your request has been sent')
    $('#message-box').addClass('success').slideDown()

  showErrorMessage = ->
    $('#message-box span').text('Your request could not be sent')
    $('#message-box').addClass('error').slideDown()

  clearFormFields = ->
    $('.field input').val('')

  $('#message-box .close').click ->
    $('#message-box').slideUp(->
      $('#message-box').removeClass('success').removeClass('error')
    )

