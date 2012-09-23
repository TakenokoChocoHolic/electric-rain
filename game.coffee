models = require './models.coffee'

class Game
  constructor: (settings) ->
    # Use default settings
    settings = new Settings() if typeof settings == 'undefined'
    @time = 1
    @players = []
    @field = new models.Field(settings.mapWidth, settings.mapHeight)
    for i in [0...settings.playerCount]
      player = new models.Player([], i, @field)
      homeLocation = new models.Point((i%2) * 50, (i/2 % 2) * 50)
      home = new models.Building(homeLocation, models.HomeTemplate, 0)
      @constructBuilding(player, homeLocation, home)
      @players.push(player)

  getMapStr: ->
    @field.str()

  advance: ->
    @time += 1
    @player.advance(this)
    
  constructBuilding: (player, location, building) ->
    player.buildings.push(building)
    @field.setObject(location, building)

  prepareDeck: (name_num_pairs) ->
    ret = []
    for name, num of name_num_pairs
      for i in [0 ... num]
        ret.push models.AllCards[name]
    ret

class Settings
  constructor: ->
    @playerCount = 4
    @mapWidth = 100
    @mapHeight = 100
    @maxTime = 10000
    
exports.Game = Game
exports.Settings = Settings
