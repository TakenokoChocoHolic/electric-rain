assert = require 'assert'
models = require "../models"
game = require "../game"

describe "Game", ->
  describe '#constructor()', ->
    it 'should create instance', ->
      assert.notEqual null, new game.Game(new game.Settings())



