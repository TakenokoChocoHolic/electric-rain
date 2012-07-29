class Building
  @sight
  @influence
  @production
  constructor: (sight, influence, production) ->
    @sight = sight
    @influence = influence
    @production = production

class Tile
  @building: null
  
  build: (building) ->
    @building = building

class Soldier
  @x
  @y
  @building
  constructor: (x, y, building) ->
    @x = x
    @y = y
    @building = building

class Map
  @tiles: []
  @width
  @height
  constructor: (width, height) ->
    @width = width
    @height = height
    for x in [0 .. width-1]
      @tiles.add([])
      for y in [0 .. height-1]
        @tiles[x].add(new Tile())
  
  build: (x, y, building) ->
    tiles[x][y].build(building)

class Game
  @players: []
  @map: new Map()
  constructor: () ->
    for i in [0 .. 4]
      players.add(new Player())
      
class Card
  @cost
  constructor: (cost) ->
    @cost = cost
  
class Hand
  @cards: []

class Deck
  @cards: []

class Player
  @hand: new Hand()
  @soldiers: []

exports.Game = Game
