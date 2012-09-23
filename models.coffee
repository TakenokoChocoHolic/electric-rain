_ = require 'underscore'
require './util'

HAND_COUNT = 3
DRAW_FREQUENCY = 10
MOVE_SPEED = 1

class Point
  constructor: (@x,@y) ->

  distance: (other) ->
    Math.abs(other.x - @x) + Math.abs(other.y - @y)

  equals: (other) ->
    other.x == @x and other.y == @y

class Army
  constructor: (@from, @to, @count) ->
    @location = @from.location

  reach: (game, mine, index) ->
    owner = @to.getOwner
    if mine == owner
      @to.army_count += @count
    else if @to.army_count > @count
      @to.army_count -= @count
    else
      index = owner.buildings.indexOf(@to)
      owner.buildings.splice(index, 1)
      @to.count = @count - @to.count
      mine.builings.push(@to)
    index = mine.armies.indexOf(this)
    mine.armies.splice(index, 1)

  advance: (game, mine, index) ->
    all = @form.distance(@to)
    now = @from.distance(@location)
    dx = @to.location.x - @from.location.x
    dx = ~~((now + 1) * dx / all) - ~~(now * dx / all)
    dy = @to.location.y - @from.location.y
    dy = ~~((now + 1) * dy / all) - ~~(now * dy / all)
    @location.x += dx
    @location.y += dy

    if @to.location.equals(@location)
      reach game, mine, index
      return

    for enemy in game.players
      if enemy != mine
        for iArmy in [0...enemy.armies.length]
          army = enemy.armies[iArmy]
          if @location.equals(army.location)
            if @count <= army.count
              if @count == army.count
                enemy.armies.splice(iArmy, 1)
              else
                army.count -= @count
              mine.armies.splice(index, 1)
              return
            else
              @count -= army.count
              enemy.armies.splice(iArmy, 1)

class Building
  constructor: (@location, @template, @army_count) ->

  advance: ->
    @army_count += @template.army_productivity

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
    _.shuffle(@deck)
    @hand      = []
    @trash     = []
    @buildings = []
    @armies    = []
    @mine_count = 20
    @draw_count = DRAW_FREQUENCY
    for i in [0...HAND_COUNT]
      @draw()

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

  advance: (game) ->
    @draw_count -= 1
    if @draw_count == 0
      @draw()
      @draw_count = DRAW_FREQUENCY

    for building in @buildings
      building.advance(game)
      @mine_count += building.template.mine_productivity

    for army in @armies
      army.advance(game, this)

class Card
  constructor: (@cost) ->

class BuildingCard extends Card
  constructor: (@cost, @template) ->
    super @cost

class BuildingTemplate
  constructor: (@name, @sight_range,
    @territory_range, @mine_productivity, @army_productivity) ->

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
exports.Player = Player
exports.Map = Map
exports.Card = Card
exports.Building= Building
exports.BuildingCard = BuildingCard
exports.AllBuildings = allBuildings
exports.HomeTemplate = allBuildings[0]
exports.AllCards = allCards
