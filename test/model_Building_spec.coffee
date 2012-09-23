assert = require 'assert'
models = require '../models'

describe 'Building', ->
  before ->
    @loc = new model.Point(3, 5)
    @template = new model.BuildingTemplate()
    @subject = new models.Building(@locc)

describe 'AllBuildings', ->
  it 'should have basic cards', ->
    all = models.AllBuildings
    assert.notEqual undefined, all
    assert.equal null, all['bad_keyword']
    assert.notEqual null, all['base']
    assert.notEqual null, all['tower']
    assert.notEqual null, all['church']
    assert.notEqual null, all['barracks']
    assert.notEqual null, all['pit']
