assert = require "assert"
models = require "../models"

describe 'Field', ->
  Field = models.Field
  describe '#constructor', ->
    it 'should create instance', ->
      assert.notEqual null, new Field(100, 100)
