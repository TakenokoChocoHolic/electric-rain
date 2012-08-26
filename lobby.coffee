Room = require('./room').Room

class Lobby
  constructor: ->
    @rooms = (new Room('room'+i) for i in [1..5])

  update: ->
    0

exports.Lobby = Lobby
