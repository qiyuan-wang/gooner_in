$ ->
  #### start the slide on the index page
  index = 0
  img1 = $('#img1')
  img2 = $('#img2')
  img3 = $('#img3')
  
  slideTo = (number) ->
    index = parseInt(number)
    if index is 1
      img2.fadeIn('slow')
      img1.fadeOut('slow')
    else if index is 2
      img3.fadeIn('slow')
      img2.fadeOut('slow')
    else
      img1.fadeIn('slow')
      img3.fadeOut('slow')
    SILDE
  
  SILDE = setInterval ( ->
    index = 0 if index >= 0
    index++
    slideTo(index)), 8000
  #### slide part over
  
  #### start login-modal client-side validatoin
  # email input validation for empty and invalid email format
  $('#login-modal input#email').focusout ->
    $('.error').remove()
    email = $(this).val()
    EMAIL_REGEX = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
    if email is ""
      $(this).after('<label class="error" id="email-error">不写email咋知道你是谁</label>')
    else if !EMAIL_REGEX.test(email)
      $(this).after('<label class="error" id="email-error">email可不长这样</label>')
  
  # password input validation for empty
  $('#login-modal input#password').focusout ->
    $('.error').remove()
    pwd = $(this).val()
    if pwd is ""
      $(this).after('<label class="error" id="password-error">空着密码怎么行啊</label>')
  #### end login-modal client-side validation
