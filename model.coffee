util = require './util'

class Building
  constructor: (@sight, @influence, @production) ->
    
    
class Tile
  @building: null
  
  build: (building) ->
    @building = building

    
class Soldier
  constructor: (@x, @y, @building) ->
    
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
  shuffle: ->
    util.shuffle @cards

  
class Player
  @hand: new Hand()
  @deck: new Deck()
  @soldiers: []

  
class Game
  @players: []
  @map: new Map()
  
  constructor: () ->
    for i in [0 .. 4]
      players.add(new Player())

  
exports.Game = Game
