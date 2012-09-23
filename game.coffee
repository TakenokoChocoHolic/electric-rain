models = require './models.coffee'

class Game
  constructor: (settings) ->
    @time = 1
    @players = []
    @field = new models.Field(settings.mapWidth, settings.mapHeight)
    for i in [0...settings.playerCount]
      player = new models.Player([], i, @field)
      @players.push(player)

  getMapStr: ->
    @field.str()

  advance: ->
    @time += 1
    @player.advance(this)

class Settings
  constructor: ->
    @playerCount = 4
    @mapWidth = 100
    @mapHeight = 100
    @maxTime = 10000

exports.Game = Game
exports.Settings = Settings
