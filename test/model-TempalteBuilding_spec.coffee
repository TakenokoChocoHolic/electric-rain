assert = require 'assert'
models = require '../models'

describe 'BuildingTemplate', ->
  it 'should be instantize', ->
    subject = new models.BuildingTemplate('home', 1, 2, 3, 4)
    assert.equal 'home', subject.name
    assert.equal      1, subject.sightRange
    assert.equal      2, subject.territoryRange
    assert.equal      3, subject.mineProductivity
    assert.equal      4, subject.armyProductivity

