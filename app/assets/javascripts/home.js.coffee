(function($) {
  "use strict";

  $(document).ready(function() {

    // PARALLAX BACKGROUNDS FOR DESKTOPS
    
    if ($(this).width() > 768) {
      $(window).stellar({
        horizontalScrolling: false
      });
    }

    $('#navigation').headroom();

    // MOBILE NAVIGATION MENU DROPDOWN
    
    var menu = $('#navigation-menu');
    var menuToggle = $('#js-mobile-menu');
    var menuLink = $('.navigation .nav-link a');

    function hideMenu() {
      if(menu.is(':hidden')) {
        menu.removeAttr('style');
      }
    }

    $(menuToggle).on('click', function(e) {
      e.preventDefault();
      menu.slideToggle(function() {
        hideMenu();
      });
    });

    $(menuLink).on('click', function() {
      if($('.navigation-menu-button').css('display') === 'block') {
        menu.slideToggle(function() {
          hideMenu();
        });
      }
    });

    // ADD ACTIVE CLASS TO NAV ITEM WHEN CLICKED
    
    $('.navigation a').on('click', function() {
      $('.navigation li').removeClass('active');
      $(this).closest('li').addClass('active');
    });


  });
})(jQuery);
