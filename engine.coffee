Game = require('./game').Game

class Engine
  constructor: ->
    console.log "new Engine()"
    @usesrs = []
    @game = new Game()

  update: ->

  getStatus: ->
    {
      map: @game.getMapStr(),
      cards: [ {kind: 1} ]
    }

  mv: (data) -> true

  build: (data) -> true

  addUser: (user) ->
    @users.add(user)

  loginUser: (user) ->
    # TODO

exports.Engine = Engine
