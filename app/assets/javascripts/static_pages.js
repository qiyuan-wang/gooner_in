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
    }, 10000);
})
