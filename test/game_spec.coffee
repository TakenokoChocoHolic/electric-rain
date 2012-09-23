assert = require 'assert'
models = require "../models"
game = require "../game"

describe "Game", ->
  describe '#constructor()', ->
    it 'should create instance', ->
      assert.notEqual null, new game.Game(new game.Settings())

  describe '#constructor()', ->
    it 'should draw card', ->
      players = new models.Player({ '塔': 40 })
      settings = new game.Settings()
      assert.notEqual null, new game.Game(players, settings)
      assert.equal Constants.INITIAL_CARD_COUNT, game.players[0].hand.size
