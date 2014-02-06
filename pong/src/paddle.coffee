class window.Paddle extends Entity
  constructor: (game) ->
    super
    @width = 20
    @height = 100
    @game = game
    @y = @game.height / 2 - @height / 2
    @score = 0

  update: ->
    super
    @y = Math.min(Math.max(@y, 0), @game.height - @height)

class window.PlayerPaddle extends Paddle
  constructor: (game) ->
    super

    @x = 20
    @game = game

  update: ->
    super
    speed = 15
    if @game.keyPressed.up
      @yVelocity = -speed
    else if @game.keyPressed.down
      @yVelocity = speed
    else
      @yVelocity = 0


class window.BotPaddle extends Paddle
  constructor: (game) ->
    super
    @game = game
    @x = @game.width - @width - 20


  update: ->
    super
    speed = 5
    if @y < @game.ball.y
      @yVelocity = speed
    else if @y > @game.ball.y
      @yVelocity = -speed
