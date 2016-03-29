$(document).ready = ->

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
