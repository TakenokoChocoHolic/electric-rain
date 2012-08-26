class User
  constructor: (@socket) ->
    console.log "new User()"
    @logined = false
    @id = 
    @name = 'guest' + @id

  setName: (name) -> @name = name

  getNmae: () -> @name

exports.User = User
