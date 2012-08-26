require '../util'

HAND_COUNT = 3

class Point
  constructor: (@x,@y) ->

  distance: (other) ->

class Army
  constructor: (@location, @to, @count) ->

class Building
  constructor: (@location, @army_count, @template) ->

class Map
  constructor: (@width, @height) ->
    @map = []

  setObject: (location, obj) ->
    # NOTE override map
    @map[location.y *  height + location.x] = obj

  getObject: (obj)->
    @map[location.y * height + location.x]
  
class Mine

class Player
  constructor: (@deck) ->
    util.shuffle(@deck)
    @hand      = []
    @trash     = []
    @buildings = []
    @armies    = []
    for i in [0...HAND_COUNT]
      draw()

  draw: ->
    @hand.push(@deck.shift())

class Card
  constructor: (@cost) ->

class BuildingCard extends Card
  constructor: (@cost, @template) ->
    super @cost

class BuildingTemplate
  constructor: (@name, @territory_range, @sight_range, @mine_productivity, @army_productivity) ->

buildings = [
      new BuildingTemplate("塔", 10, 1, 1, 1)
    , new BuildingTemplate("教会", 1, 10, 1, 1)
    , new BuildingTemplate("兵舎", 1, 1, 10, 1)
    , new BuildingTemplate("採掘場", 1, 1, 1, 10)
  ]

all_buildings = {}
for building in buildings
  all_buildings[building.name] = building

cards = [
      new BuildingCard(10, all_buildings["塔"])
    , new BuildingCard(10, all_buildings["教会"])
    , new BuildingCard(10, all_buildings["兵舎"])
    , new BuildingCard(10, all_buildings["採掘場"])
  ]

all_cards = {}
for card in cards
  all_cards[card.name] = card

exports.Card = Card
exports.BuildingCard = BuildingCard
exports.all_buildings = all_buildings
exports.all_cards = all_cards
