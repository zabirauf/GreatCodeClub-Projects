
canvas = $('canvas')[0]
game = new Game(canvas)

game.entities = [
  new Background(game),
  new Score(game),
  game.ball = new Ball(game),
  game.player = new PlayerPaddle(game),
  game.bot = new BotPaddle(game)
]

game.start()
canvas.focus()
