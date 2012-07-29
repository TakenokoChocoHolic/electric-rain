Game = require('../model').Game

assert = require "assert"

describe 'util', ->
  util = require "../util"
  describe '#shuffle()', ->
    it 'should q2', ->
      assert.equal([0..10], [0..10].shuffle().sort())

describe 'map', ->
  describe '#constructor()', ->
    it 'should ', ->
      game = new Game()
      assert.equal(true, true)

