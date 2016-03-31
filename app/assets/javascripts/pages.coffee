$(document).ready ->

  # PARALLAX BACKGROUNDS
  hideMenu = ->
    if menu.is(':hidden')
      menu.removeAttr 'style'

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

  $(menuLink).on 'click', ->
    if $('.navigation-menu-button').css('display') == 'block'
      menu.slideToggle ->
        hideMenu()

  # ADD ACTIVE CLASS TO NAV ITEM WHEN CLICKED
  $('#navigation a').on 'click', ->
    $('.navigation li').removeClass 'active'
    $(this).closest('li').addClass 'active'


  # SMOOTH SCROLLING BETWEEN SECTIONS




  # RESPONSIVE VIDEOS
  $('.fitvids').fitVids()

  # OWL CAROUSEL SLIDERS
  $('#showcase-slider, #quote-slider').owlCarousel
    autoplay: true
    autoplayTimeout: 4000
    items: 1
    loop: true

  $('#blog-teasers').owlCarousel
    autoplay: true
    autoplayHoverPause: true
    autoplayTimeout: 4000
    items: 3
    responsive:
      1: items: 1
      540: items: 2
      767: items: 3
    video: true

