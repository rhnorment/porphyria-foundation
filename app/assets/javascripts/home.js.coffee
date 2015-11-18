(($) ->

  'use strict'

  $(document).ready ->

    # PARALLAX BACKGROUNDS
    
    hideMenu = ->
      if menu.is(':hidden')
        menu.removeAttr 'style'
      return

    if $(this).width() > 768
      $(window).stellar horizontalScrolling: false

    $('#navigation').headroom()

    # MOBILE NAVIGATION MENU DROPDOWN
    


) jQuery
