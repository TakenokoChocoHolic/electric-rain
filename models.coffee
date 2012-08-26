require './util'

HAND_COUNT = 3
DRAW_SPEED = 10

class Point
  constructor: (@x,@y) ->

  distance: (other) ->
    Math.abs(other.x - @x) + Math.abs(other.y - @y)

  equals: (other) ->
    other.x == @x and other.y == @y

class Army
  constructor: (@location, @to, @count) ->

class Building
  constructor: (@location, @template, @army_count) ->

class Map
  constructor: (@width, @height) ->
    @map = []

  setObject: (location, obj) ->
    # NOTE override map
    @map[location.y *  height + location.x] = obj

  getObject: (location)->
    @map[location.y * height + location.x]

class Mine

class Player
  constructor: (@deck) ->
    util.shuffle(@deck)
    @hand      = []
    @trash     = []
    @buildings = []
    @armies    = []
    @mine_count = 0
    @draw_count = DRAW_SPEED
    for i in [0...HAND_COUNT]
      draw()

  draw: ->
    @hand.push(@deck.shift())

  advance: ->
    @draw_count -= 1
    if @draw_count == 0
      draw()
      @draw_count = DRAW_SPEED


class Card
  constructor: (@cost) ->

class BuildingCard extends Card
  constructor: (@cost, @template) ->
    super @cost

class BuildingTemplate
  constructor: (@name, @sight_range, @territory_range, @mine_productivity, @army_productivity) ->

buildings = [
      new BuildingTemplate("本拠地", 10, 10, 10, 10)
      new BuildingTemplate("塔",     10,  1,  1,  1)
    , new BuildingTemplate("教会",    1, 10,  1,  1)
    , new BuildingTemplate("兵舎",    1,  1, 10,  1)
    , new BuildingTemplate("採掘場",  1,  1,  1, 10)
  ]

allBuildings = {}
for building in buildings
  allBuildings[building.name] = building

cards = [
      new BuildingCard(10, allBuildings["塔"])
    , new BuildingCard(10, allBuildings["教会"])
    , new BuildingCard(10, allBuildings["兵舎"])
    , new BuildingCard(10, allBuildings["採掘場"])
  ]

allCards = {}
for card in cards
  allCards[card.name] = card

exports.Point = Point
exports.Card = Card
exports.BuildingCard = BuildingCard
exports.AllBuildings = allBuildings
exports.HomeTemplate = allBuildings[0]
exports.AllCards = allCards
