// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require holder
//= require jquery.stellar.min
//= require headroom.min
//= require jquery.headroom
//= require owl.carousel
//= require jquery.fitvids
//= require jquery.flexslider

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
