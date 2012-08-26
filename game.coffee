require './models.coffee'

class Game
  constructor: ->
    console.log "new Game()"
    @time = 1
    @players = []
    @map = new Map(5, 5)
    for i in [0 .. 4]
      @players.push(new Player())

  getMapStr: ->
    @map.str()

  advance: ->
    @time += 1
    @player.advance()
