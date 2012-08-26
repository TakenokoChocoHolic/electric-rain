idSeq = 0

class User
  constructor: (@socket) ->
    console.log "new User()"
    @logined = false
    @id = idSeq++
    @name = 'guest' + @id

  setName: (name) -> @name = name

  getNmae: () -> @name

exports.User = User
