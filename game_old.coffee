require './util'

class Building
  constructor: (@name, @x, @y, @sight, @influence, @production) ->
    @forces = []
  
  enter: (playerIndex, force) ->
    @forces[playerIndex] += force
  
  getX: ->
    @x
    
  getY: ->
    @y

  str: ->
    'o'


class Tile
  constructor: (@building) ->

  build: (building) ->
    @building = building

  str: ->
    if @building == null
      '.'
    else
      @building.str()


class Army
  MOVE_SPEED: 1
  
  constructor: (@playerIndex, @force, @source, @destination) ->
    @elapsedTime = 0
    @necessaryTime =
      Math.sqrt( Math.pow(destination.getX() - source.getX())
      + Math.pow(destination.getY() - source.getY()) )
    
  move: ->
    elapsedTime++
    if elapsedTime >= necessaryTime
      @destination.enter(@playerIndex, @force)
      false
    else
      true


class Map
  constructor: (@width, @height) ->
    @tiles = []
    for x in [0 .. @width-1]
      @tiles.push([])
      for y in [0 .. @height-1]
        @tiles[x].push(new Tile(null))
  
  build: (x, y, building) ->
    @tiles[x][y].build(building)

  str: ->
    ret = ''
    for x in [0 .. @width - 1]
      for y in [0 .. @height - 1]
        ret += @tiles[x][y].str()
      ret += '\n'
    ret


class Hand
  constructor: ->
    @cards = []


class Deck
  constructor: ->
    @cards = []

  shuffle: ->
    util.shuffle @cards


class Player
  constructor: ->
    @hand = new Hand()
    @deck = new Deck()
    @soldiers = []


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

  


exports.Game = Game
