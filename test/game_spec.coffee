assert = require 'assert'
models = require "../models"
game = require "../game"

describe "Game", ->
  describe '#constructor()', ->
    it 'should create instance', ->
      settings = new game.Settings()
      assert.notEqual null, new game.Game(settings)

