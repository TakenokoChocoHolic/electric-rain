assert = require "assert"
models = require "../models"

describe 'Player', ->
  beforeEach ->
    @deck = []
    for i in [0...40]
      @deck.push(models.AllCards['pit'])
    @player = new models.Player(@deck)

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
