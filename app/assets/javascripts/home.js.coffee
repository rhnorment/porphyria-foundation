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
  menuToggle = $('#js-mobile-menu')
  menuLink = $('.navigation .nav-link a')

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

  $('#navigation').on 'click', ->
    $('.navigation li').removeClass 'active'
    $(this).closest('li').addClass 'active'
    return

  # SMOOTH SCROLLING BETWEEN SECTIONS

  $('a[href*=#section-]').on 'click', ->
    navHeight = $('header#navigation').height()
    top = $(document).scrollTop()

    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') or location.hostname == @hostname
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')

      if target.length
        if $(@hash).offset().top < top
          # scroll section includes nav-height
          $('html,body').animate { scrollTop: target.offset().top - navHeight }, 600
          return false
        else
          # scroll position without nav-height
          $('html,body').animate { scrollTop: target.offset().top + 2 }, 600
          return false
        return

  # RESPONSIVE VIDEOS - FITVIDS
  $('.fitvids').fitVids()

  # OWL CAROUSEL SLIDERS

  $('#showcase-slider').owlCarousel
    items: 1
    loop: true
    autoPlay: true
    autoplayTimeout: 4000

