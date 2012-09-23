models = require './models.coffee'

class Game
  constructor: (@settings) ->
    @time = 1
    @players = []
    @map = new models.Map(@settings.mapWidth, @settings.mapHeight)
    for i in [0...@settings.playerCount]
      pl = new models.Player([])
      homeLoc = { x: (i%2 * 50), y: (i/2 % 2) * 50 }
      home = new models.Building(homeLoc, models.HomeTemplate, 0)
      pl.buildings.push home
      @players.push(pl)

  getMapStr: ->
    @map.str()

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
