($) ->
  'use strict'
  $(document).ready ->
    # PARALLAX BACKGROUNDS FOR DESKTOPS

    hideMenu = ->
      if menu.is(':hidden')
        menu.removeAttr 'style'
      return

    if $(this).width() > 768
      $(window).stellar horizontalScrolling: false
    $('#navigation').headroom()

    # MOBILE NAVIGATION MENU
    menu = $('#navigation-menu')
    menuToggle = $('#js-mobile-menu')
    menuLink = $($'.navigation .nav-link a')
    $(menuToggle).on 'click', (e) ->
      e.preventDefault()
      menu.slideToggle ->
        hideMenu()
        return
      return
    $(menuLink).on 'click', ->
      if $('.navigation-menu-button').css('display') == 'block'
        menu.slideToggle ->
          hideMenu()
          return
        return


