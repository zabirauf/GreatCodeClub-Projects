
init = () ->
  canvas = $('canvas')[0]
  game = new Game(canvas)

  game.entities = [
    new Background(game),
    game.obstacles = new Obstacles(game),
    game.bird = new Bird(game),
    game.score = new Score(game),
    game.ground = new Grass(game)
  ]
  document.getElementById('play-again').addEventListener 'click', () ->
    game.gameOver false
    $('canvas')[0].focus()


  game.gameOver false
  game.start()
  canvas.focus()


resources.onReady(init)
resources.load([
  "assets/bg.png",
  "assets/grassCenter.png",
  "assets/grassMid.png",
  "assets/bird.png"
])

