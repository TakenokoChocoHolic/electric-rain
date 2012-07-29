Game = require('./model').Game

class Engine
  @users: []
  @game: new Game()

  constructor: () ->
  getStatus: () ->
    {
      map: game.getMapStr(),
      cards: [ {kind: 1} ]
    }
  mv: (data) -> true
  build: (data) -> true
  addUser: (user) ->
    @users.add(user)
  loginUser: (user) ->
    # TODO

exports.Engine = Engine

