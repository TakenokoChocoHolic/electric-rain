class Building
  constructor: (@x, @y, @sight, @influence, @production) ->
    @forces = []
  
  enter: (playerIndex, force) ->
    @forces[playerIndex] += force
  
  getX: () ->
    return @x
    
  getY: () ->
    return @y
    
    
class Tile
  @building: null
  
  build: (building) ->
    @building = building

    
class Army
  MOVE_SPEED: 1
  
  constructor: (@playerIndex, @force, @source, @destination) ->
    @elapsedTime = 0
    @necessaryTime =
      Math.sqrt( Math.pow(destination.getX() - source.getX())
      + Math.pow(destination.getY() - source.getY()) )
    
  move: () ->
    elapsedTime++
    if elapsedTime >= necessaryTime
      @destination.enter(@playerIndex, @force)
      return false
    else
      return true

class Map
  @tiles: []
  
  constructor: (@width, @height) ->
    for x in [0 .. width-1]
      @tiles.add([])
      for y in [0 .. height-1]
        @tiles[x].add(new Tile())
  
  build: (x, y, building) ->
    tiles[x][y].build(building)
    
      
class Card
  constructor: () ->
  
  
class Hand
  @cards: []

  
class Deck
  @cards: []
  
  constructor: () ->

  
class Player
  @hand: new Hand()
  @deck: new Deck()
  @armies: []

  
class Game
  @players: []
  @map: new Map()
  
  constructor: () ->
    for i in [0 .. 4]
      players.add(new Player())

  
exports.Game = Game
