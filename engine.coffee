Game = require('./model').Game

class Engine
  constructor: () ->
    @usesrs = []
    @game = new Game()
  update: () ->
  getStatus: () ->
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

