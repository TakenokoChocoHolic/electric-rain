assert = require "assert"
models = require "../models"

describe 'Field', ->
  Field = models.Field
  describe '#constructor', ->
    it 'should create instance', ->
      assert.notEqual null, new Field(100, 100)

#describe 'Player', ->
#  describe '#constructor()', ->
#    it 'should create instance', ->
#      player = new models.Player({ '塔': 40 })
#      assert.notEqual null, player
