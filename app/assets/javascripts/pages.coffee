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

  menu = $('#navigation-menu')
  menuLink = $('.navigation .nav-link a')
  menuToggle = $('#js-mobile-menu')

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

  # ADD ACTIVE CLASS TO NAV ITEM WHEN CLICKED

  $('#navigation a').on 'click', ->
    $('.navigation li').removeClass 'active'
    $(this).closest('li').addClass 'active'
    return

  # SMOOTH SCROLLING BETWEEN SECTIONS

  # RESPONSIVE VIDEOS
  $('.fitvids').fitVids()

  # OWL CAROUSEL SLIDERS
  
