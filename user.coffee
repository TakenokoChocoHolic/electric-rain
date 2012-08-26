class User
  constructor: (@socket, id) ->
    console.log "new User()"
    @logined = false
    @id = id
    @name = 'guest' + @id

  setName: (name) -> @name = name

  getNmae: () -> @name

exports.User = User
