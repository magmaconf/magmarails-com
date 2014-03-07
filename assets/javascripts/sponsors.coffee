$(document).ready ->

  $('#contact').submit (ev) ->
    ev.preventDefault()
    if $(@).valid()
      $.ajax
        url: "/send_email"
        type: 'post'
        data: $(@).serialize() + requestType()
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
    if currentPath() is '/'
      $('#newsletter').addClass('sent')
    else
      $('#message-box').addClass('success')
      $('#message-box span').text('Your request has been sent')

  showErrorMessage = ->
    $('#message-box').addClass('error')
    $('#message-box span').text('Your request could not be sent')

  $('.mail-button a').click ->
    toggleContactForm()
    $("input[name='name']").focus()

  $('.cancel-button').click ->
    toggleContactForm()

  toggleContactForm = ->
    $('#contact-form').toggle()

  clearFormFields = ->
    $('.field input').val('')

  $('#message-box .close').click ->
    $('#message-box').hide()

  currentPath = ->
    $(location).attr('pathname')

  requestType = ->
    requestName = if currentPath() is '/' then 'newsletter' else 'sponsor'
    '&type=' + requestName
