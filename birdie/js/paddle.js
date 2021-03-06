// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Paddle = (function(_super) {
    __extends(Paddle, _super);

    function Paddle(game) {
      Paddle.__super__.constructor.apply(this, arguments);
      this.width = 20;
      this.height = 100;
      this.game = game;
      this.y = this.game.height / 2 - this.height / 2;
      this.score = 0;
    }

    Paddle.prototype.update = function() {
      Paddle.__super__.update.apply(this, arguments);
      return this.y = Math.min(Math.max(this.y, 0), this.game.height - this.height);
    };

    return Paddle;

  })(Entity);

  window.PlayerPaddle = (function(_super) {
    __extends(PlayerPaddle, _super);

    function PlayerPaddle(game) {
      PlayerPaddle.__super__.constructor.apply(this, arguments);
      this.x = 20;
      this.game = game;
    }

    PlayerPaddle.prototype.update = function() {
      var speed;
      PlayerPaddle.__super__.update.apply(this, arguments);
      speed = 15;
      if (this.game.keyPressed.up) {
        return this.yVelocity = -speed;
      } else if (this.game.keyPressed.down) {
        return this.yVelocity = speed;
      } else {
        return this.yVelocity = 0;
      }
    };

    return PlayerPaddle;

  })(Paddle);

  window.BotPaddle = (function(_super) {
    __extends(BotPaddle, _super);

    function BotPaddle(game) {
      BotPaddle.__super__.constructor.apply(this, arguments);
      this.game = game;
      this.x = this.game.width - this.width - 20;
    }

    BotPaddle.prototype.update = function() {
      var speed;
      BotPaddle.__super__.update.apply(this, arguments);
      speed = 5;
      if (this.y < this.game.ball.y) {
        return this.yVelocity = speed;
      } else if (this.y > this.game.ball.y) {
        return this.yVelocity = -speed;
      }
    };

    return BotPaddle;

  })(Paddle);

}).call(this);
