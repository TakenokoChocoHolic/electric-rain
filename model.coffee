util = require './util'

class Building
  constructor: (@sight, @influence, @production) ->
    
    
class Tile
  build: (building) ->
    @building = building

  str: () ->
    if (@building == null)
      '.'
    else
      building.str()

    
class Soldier
  constructor: (@x, @y, @building) ->

class Map
  constructor: (@width, @height) ->
    @tiles = []
    for x in [0 .. width-1]
      @tiles.add([])
      for y in [0 .. height-1]
        @tiles[x].add(new Tile())
  
  build: (x, y, building) ->
    @tiles[x][y].build(building)

  str: () ->
    ret = ''
    for x in [0 .. width - 1]
      for y in [0 .. height - 1]
        ret += @tiles[x][y].str()
      ret += '\n'
    ret
    
      
class Card
  constructor: () ->
  
  
class Hand
  constructor: () ->
    @cards = []

class Deck
  constructor: () ->
    @cards = []
  shuffle: ->
    util.shuffle @cards

  
class Player
  constructor: () ->
    @hand = new Hand()
    @deck = new Deck()
    @soldiers = []

  
class Game
  constructor: () ->
    @players = []
    @map = new Map(5, 5)
    for i in [0 .. 4]
      @players.add(new Player())

  getMapStr: () ->
    @map.str()

  
exports.Game = Game
