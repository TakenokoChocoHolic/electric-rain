Game = require('./game').Game

class Engine
  constructor: ->
    console.log "new Engine()"
    @users = []
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
    @users.push(user)

  removeUser: (user) ->
    for i in [0..@users.length]
      if @users[i].id is user.id
        @users.splice(i, 1)
        break


  loginUser: (user, name) ->
    if user.logined
      false
    else
      user.name = name
      user.logined = true;
      true

exports.Engine = Engine
