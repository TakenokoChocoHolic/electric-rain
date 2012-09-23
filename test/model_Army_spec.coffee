assert = require 'assert'
models = require '../models'
game = require '../game'

describe 'Army', ->
  beforeEach ->
    @game = new game.Game()
    @friend = @game.players[0]
    @enemy = @game.players[1]
    @friend.advance(@game) for i in [0...10]

  it 'should reach an enemy building', ->
    army = @game.sortie(@friend, @friend.base(), @enemy.base(), 100)
    requiredTurns = Math.ceil(
      army.fromBuilding.location.distance(army.toBuilding.location) /
      models.Constants.MOVE_SPEED)
    # Move army before reaching the target building
    @friend.advance(@game) for i in [0...(requiredTurns-1)]
    assert.equal army, @friend.armies[0]
    # Move army to reach the target building
    @friend.advance(@game)
    console.log(army)
    assert.equal 0, @friend.armies.length
