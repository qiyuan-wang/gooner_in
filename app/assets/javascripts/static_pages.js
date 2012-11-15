$().ready(function() {
    var index = 0;
    var img1 = $('#img1');
    var img2 = $('#img2');
    var img3 = $('#img3');
    
    function slideTo(number) {
        index = parseInt(number);
        if (index === 1) {
            img2.fadeIn('slow');
            img1.fadeOut('slow'); 
        } else if (index === 2) {
            img3.fadeIn('slow');
            img2.fadeOut('slow');
        } else {
            img1.fadeIn('slow');
            img3.fadeOut('slow');
        }
          
        SLIDE;
    }
    var SLIDE;
    SLIDE = setInterval(function() {
      if (index >= 3) index = 0;
      index++;
      slideTo(index);
    }, 8000);
      
    $('#login-modal input#email').focusout(function()
    {
      $('.error').remove();
      var email = $(this).val();
      var EMAIL_REGEX = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/;
      if(email == "")
      {
        $(this).after('<label class="error" id="email-error">不写email咋知道你是谁</label>');
      } else if(!EMAIL_REGEX.test(email))
      {
        $(this).after('<label class="error" id="email-error">email可不长这样</label>');
      }
    });
    
    $('#login-modal input#password').focusout(function()
    {
      $('.error').remove();
      var pwd = $(this).val();
      if(pwd == "")
      {
        $(this).after('<label class="error" id="password-error">空着密码怎么行啊</label>');
      }
    });
    
    $('#login-modal ')
})
