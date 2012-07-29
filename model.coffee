class Game
  players: []
  map: Map
  constructor: () ->
    for i in [0 .. 4]
      players.add(Player)
  
class Player
  hand: Hand
  soldiers: []
  
class Hand
  cards: []

class Deck
  cards: []
  
class Card
  constructor: (@cost) ->

class Map
  @tiles: []
  constructor: (@width, @height) ->
    for x in [0 .. width-1]
      @tiles.add []
      for y in [0 .. height-1]
        @tiles[x].add []
  
class Tile
  building: null

class Soldier
  constructor: (@x, @y, @building) ->
  
class Building
  constructor: (@sight, @influence, @production) ->