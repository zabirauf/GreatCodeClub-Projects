
class window.Entity
  constructor: ->
    @x = 0
    @y = 0
    @width = 0
    @height = 0
    @xVelocity = 0
    @yVelocity = 0

    @game = null

  update: ->
    @x+=@xVelocity
    @y+=@yVelocity

  draw: (context) ->
    context.fillStyle = '#fff'
    context.fillRect @x,@y,@width,@height

  intersect: (other) ->
    @y+@height > other.y &&
      @y < other.y+other.height &&
      @x+@width > other.x &&
      @x < other.x+other.width


class window.Background extends Entity
  constructor: (game)->
    super
    @game = game
    @width = @game.width
    @height = @game.height

  draw: (context) ->
    context.fillStyle = '#000'
    context.fillRect @x,@y,@width,@height


class window.Score extends Entity
  constructor: (game) ->
    super
    @game = game

  draw: (context) ->
    context.fillStyle = '#fff'
    context.font = '40px monospace'
    context.fillText @game.player.score, @game.width * 3 / 8 , 50
    context.fillText @game.bot.score, @game.width * 5 / 8, 50
