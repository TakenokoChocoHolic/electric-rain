assert = require 'assert'
models = require "../models"
game = require "../game"

describe "Game", ->
  describe '#constructor()', ->
    it 'should create instance', ->
      settings = new game.Settings()
      assert.notEqual null, new game.Game(settings)

  describe '#constructor()', ->
    beforeEach ->
      players = [new models.Player({ '塔': 40 })]
      settings = new game.Settings()
      game = new game.Game(players, settings)

    it 'should construct deck', ->
      assert.notEqual null, game
      assert.equal models.Constants.INITIAL_CARD_COUNT,
        game.players[0].hand.size

    it 'should draw cards', ->
      game.players[0].draw()
      game.players[0].draw()
      assert.equal models.Constants.INITIAL_CARD_COUNT + 2,
        game.players[0].hand.size
