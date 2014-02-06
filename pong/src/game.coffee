class window.Game
  constructor:  (canvas)->
    @context = canvas.getContext("2d")
    @width = canvas.width
    @height = canvas.height
    @keyPressed = {}
    @keys = {
      32: "space",
      37: "left",
      38: "up",
      39: "right",
      40: "down"
    }
    @entities = []

    $(canvas).on "keydown keyup", (e) =>
      keyName = @keys[e.which]
      if keyName
        @keyPressed[keyName] = e.type is 'keydown'
        e.preventDefault()
  draw: ->
    @entities.forEach (entity) =>
      entity.draw(@context) if entity.draw
  
  update: ->
    @entities.forEach (entity) =>
      entity.update() if entity.update
  
  start: ->
    fps = 60
    interval = 1000/fps
    setInterval () =>
      @update()
      @draw()
    , interval


