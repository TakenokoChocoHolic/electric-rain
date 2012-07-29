class User
  @logined: false
  @name: null

  constructor: (@socket) ->
  setName: (name) -> @name = name
  getNmae: () -> @name

exports.User = User