$(document).ready ->

  $('#contact').submit (ev) ->
    ev.preventDefault()
    if $(@).valid()
      $.ajax
        url: "/send_email"
        type: 'post'
        data: $(@).serialize()
        success: () ->
          clearFormFields()
          showSuccessMessage()
        error: () ->
          showErrorMessage()


  $('#contact').validate
    rules:
      name: 'required'
      company: 'required'
      email:
        required: true
        email: true

  showSuccessMessage = ->
    $('#message-box').addClass('success')
    $('#message-box span').text('Your request has been sent')

  showErrorMessage = ->
    $('#message-box').addClass('error')
    $('#message-box span').text('Your request could not be sent')

  $('#mail-button a').click ->
    toggleContactForm()

  $('.cancel-button').click ->
    toggleContactForm()

  toggleContactForm = ->
    $('#mail-button').toggle()
    $('#contact-form').toggle()

  clearFormFields = ->
    $('.field input').val('')

  $('#message-box .close').click ->
    $('#message-box').hide()