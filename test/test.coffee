assert = require "assert"

describe 'util', ->
  util = require "../util"
  describe '#shuffle()', ->
    it 'should q2', ->
      assert.equal([0..10], [0..10].shuffle().sort())
