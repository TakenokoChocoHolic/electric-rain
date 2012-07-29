assert = require "assert"

describe 'util', ->
  util = require "../util"
  describe '#shuffle()', ->
    it 'should leave all elements', ->
      array = [0...100].shuffle().sort (x, y) -> x - y
      for index in [0...100]
        assert.equal(index, array[index])
  describe '#clone()', ->
    it 'should clone an array', ->
      assert.equal(5, [0..10].clone().indexOf(5))
    it 'should clone an object', ->
      obj = new Object()
      obj.name = "abc"
      obj.value = 2
      assert.equal("abc", obj.clone().name)
      assert.equal(2, obj.clone().value)
