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
    @isGameOver = false
    $(canvas).on "keydown keyup", (e) =>
      for keyVal, keyName of @keys
      #Clear all the array of keypressed
        @keyPressed[keyName] = {}
        @keyPressed[keyName]['keydown'] = false
        @keyPressed[keyName]['keyup'] = false

      keyName = @keys[e.which]
      if keyName
        @keyPressed[keyName]['keydown'] = e.type is 'keydown'
        @keyPressed[keyName]['keyup'] = e.type is 'keyup'
        e.preventDefault()
  draw: ->
    @entities.forEach (entity) =>
      entity.draw(@context) if entity.draw

  update: ->
    @entities.forEach (entity) =>
      entity.update() if entity.update

  gameOver: (isGameOver)->
    @isGameOver = isGameOver
    if @isGameOver
      document.getElementById('game-over').style.display = "block"
      document.getElementById('game-over-overlay').style.display = "block"
    else
      document.getElementById('game-over').style.display = "none"
      document.getElementById('game-over-overlay').style.display = "none"

  start: ->
    fps = 60
    interval = 1000/fps
    setInterval () =>
      if not @isGameOver
        @update()
        @draw()
    , interval


