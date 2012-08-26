models = require './models.coffee'

class Game
  constructor: () ->
    console.log "new Game()"

  getMapStr: ->
    @map.str()

  advance: ->
    @time += 1
    @player.advance()

  initalizeGame: () ->
    @time = 1
    @players = []
    @map = new models.Map(100, 100)
    for i in [0 .. 4]
      pl = new models.Player([])
      homeLoc = { x: (i%2 * 50), y: (i/2 % 2) * 50 }
      home = new Building(homeLoc, models.HomeTemplate, 0)
      pl.buildings.push home
      @players.push(pl)
    
exports.Game = Game
