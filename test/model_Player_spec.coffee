assert = require "assert"
models = require "../models"
game = require "../game"

describe 'Player', ->
  beforeEach ->
    settings = new game.Settings()
    settings.deckPatterns = [{pit: 40}]
    @game = new game.Game(settings)
    @player = @game.players[0]
    @game.start() 

  describe '#constructor()', ->
    it 'should create instance', ->
      assert.notEqual null, @player

    it 'should draw initial cards', ->
      assert.equal models.Constants.INITIAL_CARD_COUNT,
        @player.hand.length

    it 'should draw cards', ->
      @player.drawCard()
      @player.drawCard()
      assert.equal models.Constants.INITIAL_CARD_COUNT + 2,
        @player.hand.length

    it 'should draw and discard cards', ->
      @player.drawCard()
      @player.drawCard()
      @player.discardCard('pit')
      @player.discardCard('pit')
      assert.equal models.Constants.INITIAL_CARD_COUNT,
        @player.hand.length

    it 'advance turns for drawing no card', ->
      for i in [0...(models.Constants.DRAW_FREQUENCY - 1)]
        @player.advance()
      assert.equal models.Constants.INITIAL_CARD_COUNT,
        @player.hand.length

    it 'advance turns for drawing cards', ->
      for i in [0...(models.Constants.DRAW_FREQUENCY * 3)]
        @player.advance()
      assert.equal models.Constants.INITIAL_CARD_COUNT + 3,
        @player.hand.length
