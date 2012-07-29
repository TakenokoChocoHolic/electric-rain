class User
  constructor: (@socket) ->
    console.log "new User()"
    @logined = false
    @name = null

  setName: (name) -> @name = name

  getNmae: () -> @name

exports.User = User
