assert = require 'assert'
models = require "../models"
game = require "../game"

describe "Game", ->
  before ->
    deckA = [] #{church: 5, tower: 7}
    deckB = []
    deckC = []
    @settings = new game.Settings()
    @settings.deckPatterns = [deckA, deckB, deckC]

  describe '#constructor()', ->
    it 'should create instance', ->
      assert.notEqual null, new game.Game(@settings)

  describe '#constructor()', ->
    it 'should create players', ->
      game = new game.Game(@settings)
      assert.notEqual null, game.players
      assert.equal 3, game.players.length

#  describe '#constructor()', ->
#    beforeEach ->
#      players = [new models.Player({ '塔': 40 })]
#      settings = new game.Settings()
#      game = new game.Game(players, settings)
#
#    it 'should construct deck', ->
#      assert.notEqual null, game
#      assert.equal models.Constants.INITIAL_CARD_COUNT,
#        game.players[0].hand.size
#
#    it 'should draw cards', ->
#      game.players[0].draw()
#      game.players[0].draw()
#      assert.equal models.Constants.INITIAL_CARD_COUNT + 2,
#        game.players[0].hand.size
    
#  describe 'create deck from deckPattern', ->
#    it 'should be OK', ->
#      game = new game.Game(@settings)
#      player = game.players[0]
#      assert.equal 12, player.deck.length
