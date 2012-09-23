randomChar = require('./util').randomChar

class User
  constructor: (@socket) ->
    console.log "new User()"
    @logined = false
    @id = randomChar(8)
    @name = 'guest#' + @id


  setName: (name) -> @name = name

  getName: () -> @name

exports.User = User
