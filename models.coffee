_ = require 'underscore'
require './util'

HAND_COUNT = 3
DRAW_FREQUENCY = 10
MOVE_SPEED = 1

class Point
  constructor: (@x, @y) ->

  distance: (other) ->
    Math.abs(other.x - @x) + Math.abs(other.y - @y)

  equals: (other) ->
    other.x == @x and other.y == @y

class Army
  constructor: (@from, @to, @power) ->
    @location = @from.location

  # indexはPlayer.armiesにおける自分のindex
  reach: (game, me, index) ->
    owner = @to.getOwner
    if me == owner
      @to.army_power += @power
    else if @to.army_power > @power
      @to.army_power -= @power
    else
      index = owner.buildings.indexOf(@to)
      owner.buildings.splice(index, 1)
      @to.power = @power - @to.power
      me.builings.push(@to)
    index = me.armies.indexOf(this)
    me.armies.splice(index, 1)

  # indexはPlayer.armiesにおける自分のindex
  advance: (game, me, index) ->
    all = @form.distance(@to)
    now = @from.distance(@location)
    dx = @to.location.x - @from.location.x
    dx = ~~((now + 1) * dx / all) - ~~(now * dx / all)
    dy = @to.location.y - @from.location.y
    dy = ~~((now + 1) * dy / all) - ~~(now * dy / all)
    @location.x += dx
    @location.y += dy

    if @to.location.equals(@location)
      reach game, me, index
      return

    for enemy in game.players
      if enemy != mine
        for iArmy in [0...enemy.armies.length]
          army = enemy.armies[iArmy]
          if @location.equals(army.location)
            if @power <= army.power
              if @power == army.power
                enemy.armies.splice(iArmy, 1)
              else
                army.power -= @power
              me.armies.splice(index, 1)
              return
            else
              @power -= army.power
              enemy.armies.splice(iArmy, 1)

class Building
  constructor: (@location, @template, @army_power) ->

  advance: ->
    @army_power += @template.armyProductivity

  isOwned: (player) ->
    for building in player.buildings
      if building == player
        return true
    return false

  getOwner: (game) ->
    for player in game.players
      for building in player.buildings
        if building == player
          return player
    throw new Error('Not found owner.')

class Field
  constructor: (@width, @height) ->
    @map = []
    for y in [0...@height.length]
      for x in [0...@width]
        @setObject(new Point(x, y), null)

  setObject: (location, obj) ->
    # NOTE override map
    @map[@getIndex(location)] = obj

  getObject: (location) ->
    @map[@getIndex(location)]
  
  getIndex: (location) ->
    location.y * @height + location.x

class Mine

class Player
  constructor: (@deck, index, map) ->
    _.shuffle(@deck)
    @hand      = []
    @trash     = []
    @buildings = []
    @armies    = []
    @gold = 20
    @draw_count = DRAW_FREQUENCY
    for i in [0...HAND_COUNT]
      @draw()
    homeLocation = { x: (index%2 * 50), y: (index/2 % 2) * 50 }
    home = new Building(homeLocation, HomeTemplate, 0)
    @constructBuilding(home, map)

  draw: ->
    @hand.push(@deck.shift())

  useCard: (name) ->
    index = -1
    for iHand in [0...@hand.length]
      if @hand[iHand].name == name
        index = iHand
    if index == -1
      console.log "not found: " + name
    else
      @trush.push @hand[index]
      @hand.splice index, 1
    index >= 0

  advance: (game) ->
    @draw_count -= 1
    if @draw_count == 0
      @draw()
      @draw_count = DRAW_FREQUENCY

    for building in @buildings
      building.advance(game)
      @eine_count += building.template.mineProductivity

    for army in @armies
      army.advance(game, this)
      
  constructBuilding: (building, map) ->
    @buildings.push(building)
    map.setObject(building)

class Card
  constructor: (@cost) ->

class BuildingCard extends Card
  constructor: (@cost, @template) ->
    super @cost

class BuildingTemplate
  constructor: (@name, @sightRange,
    @territoryRange, @mineProductivity, @armyProductivity) ->

buildings = [
    new BuildingTemplate('base',    10, 10, 10, 10)
  , new BuildingTemplate('tower',   10,  1,  1,  1)
  , new BuildingTemplate('church',   1, 10,  1,  1)
  , new BuildingTemplate('barracks', 1,  1, 10,  1)
  , new BuildingTemplate('pit',      1,  1,  1, 10)
  ]

allBuildings = {}
for building in buildings
  allBuildings[building.name] = building

cards = [
    new BuildingCard(10, allBuildings["tower"])
  , new BuildingCard(10, allBuildings["church"])
  , new BuildingCard(10, allBuildings["barracks"])
  , new BuildingCard(10, allBuildings["pit"])
  ]

allCards = {}
for card in cards
  allCards[card.name] = card

exports.Point = Point
exports.Player = Player
exports.Field = Field
exports.Card = Card
exports.Building= Building
exports.BuildingTemplate = BuildingTemplate
exports.BuildingCard = BuildingCard
exports.AllBuildings = AllBuildings = allBuildings
exports.HomeTemplate = HomeTemplate = allBuildings[0]
exports.AllCards = allCards
