class Engine
  @users: []

  constructor: () ->
  getStatus: () ->
    {
      map: '....\n....\n....\n..o.\n',
      cards: [ {kind: 1} ]
    }
  mv: (data) -> true
  build: (data) -> true
  addUser: (user) ->
    @users.add(user)

class User
  @logined: false

  constructor: (@socket) ->

exports.Engine = Engine
