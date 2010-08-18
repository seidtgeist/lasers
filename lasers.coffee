after = (delay, callback) ->
  setTimeout callback, delay

every = (interval, callback) ->
  setInterval callback, interval

pick = ->
  arguments[~~(Math.random() * arguments.length)] unless arguments.length == 0

jQuery(document).ready ($) ->
  body = $('body')
  heading = $('h1')
  party = $('<div/>').attr('id', 'party')
  height = $(document).height()
  width = $(document).width()
  
  xLasers = ~~(width/70)
  yLasers = ~~(height/70)
  
  for i in [0...xLasers]
    
    translateX = i * 70
    rotate = -85 + i * 3
    transform = "translate(#{translateX}px, 0px) rotate(#{rotate}deg)"
    
    $('<div/>')
      .addClass('purple laser')
      .css({
        'bottom': '-10px'
        'left': '0px'
        '-webkit-transform': transform
        '-moz-transform':    transform
        '-o-transform':      transform
        'transform':         transform
      })
      .appendTo(party)
  
  for j in [0...yLasers]
    
    translateY = 70*j
    rotate = (j+1)*2
    transform = "translate(0px, #{translateY}px) rotate(#{rotate}deg)"
    
    $('<div/>')
      .addClass('blue laser')
      .css({
        'top': '0px'
        'left': '-10px'
        '-webkit-transform': transform
        '-moz-transform':    transform
        '-o-transform':      transform
        'transform':         transform
      })
      .appendTo(party)
  
  body.append(party)
  
  # OH MY GOD, IT’S A CALLBACK PINETREE!
  every 10000, ->
    heading.addClass('no-power')
    after 20, ->
      heading.removeClass('no-power')
      after 500, ->
        heading.addClass('no-power')
        after 20, ->
          heading.removeClass('no-power')