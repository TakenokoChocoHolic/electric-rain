assert = require "assert"
models = require "../models"

describe 'Point', ->
  Point = models.Point

  describe '#constructor', ->
    it 'should save x', -> assert.equal(3, new Point(3, 5).x)
    it 'should save y', -> assert.equal(5, new Point(3, 5).y)

  describe '#equals', ->
    it 'should same',      ->
      assert.equal(true,  new Point(3, 5).equals(new Point(3, 5)))
    it 'should defferent', ->
      assert.equal(false, new Point(3, 5).equals(new Point(5, 3)))

  describe '#distance', ->
    it 'shoould calc manhattan distance', ->
      assert.equal(3, new Point(2, 8).distance(new Point(3, 10)))

describe 'Map', ->
  Map = models.Map
  describe '#constructor', ->
    it 'should create instance', ->
      assert.notEqual null, new Map(100, 100)
