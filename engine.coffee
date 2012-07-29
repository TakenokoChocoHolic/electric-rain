class Engine
  @users: []

  constructor: () ->
  update: () ->
  getStatus: () ->
    {
      map: '....\n....\n....\n..o.\n',
      cards: [ {kind: 1} ]
    }
  mv: (data) -> true
  build: (data) -> true
  addUser: (user) ->
    @users.add(user)
  loginUser: (user) ->
    # TODO

exports.Engine = Engine

