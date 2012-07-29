require './util'

class Building
  constructor: (@name, @sight, @influence, @production) ->
  str: () ->
    'o'
    
    
class Tile
  constructor: (@building) ->
  build: (building) ->
    @building = building

  str: () ->
    if (@building == null)
      '.'
    else
      @building.str()

    
class Soldier
  constructor: (@x, @y, @building) ->

class Map
  constructor: (@width, @height) ->
    @tiles = []
    for x in [0 .. @width-1]
      @tiles.push([])
      for y in [0 .. @height-1]
        @tiles[x].push(new Tile(null))
  
  build: (x, y, building) ->
    @tiles[x][y].build(building)

  str: () ->
    ret = ''
    for x in [0 .. @width - 1]
      for y in [0 .. @height - 1]
        ret += @tiles[x][y].str()
      ret += '\n'
    ret


class Card
  constructor: (@cost) ->


class BuildingCard
  constructor: (@cost, @building) ->


all_buildings = [
      new Building("塔", 10, 1, 1)
    , new Building("教会", 1, 10, 1)
    , new Building("砦", 1, 1, 10)
  ]

all_cards = [
      new BuildingCard 10, all_buildings[0]
    , new BuildingCard 10, all_buildings[1]
    , new BuildingCard 10, all_buildings[2]
  ]

class Hand
  constructor: () ->
    @cards = []

class Deck
  constructor: () ->
    @cards = []

  shuffle: ->
    @cards.shuffle()

  
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
      @players.push(new Player())

  getMapStr: () ->
    @map.str()

  
exports.Game = Game
