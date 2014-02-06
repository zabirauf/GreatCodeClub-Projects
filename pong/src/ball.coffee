class window.Ball extends Entity
  constructor: (game)->
    super
    @width = 20
    @height = 20
    @game = game

    @reset()
  
  update: ->
    super
    if @y > @game.height-@height or @y<0
      @yVelocity *= -1

    if @x > @game.width-@width
      @game.player.score +=1
      @reset()

    if @x < 0
      @game.bot.score +=1
      @reset()

    if @intersect @game.bot
      hitter = @game.bot
    else if @intersect @game.player
      hitter = @game.player

    if hitter
      @xVelocity *= -1.1
      @yVelocity *= -1.1

      @yVelocity += hitter.yVelocity / 4

  reset: ->
    @x = @game.width / 2 -@width
    @y = @game.height / 2-@height

    min = -5
    max = 5
    @xVelocity = if Math.random() > 0.5 then 5 else -5
    @yVelocity = (Math.floor(Math.random() * (max - min + 1) + min))


