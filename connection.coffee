User = require('./user').User

exports.start = (app, lobby) ->
  io = require('socket.io').listen(app)
  room = null

  io.sockets.on 'connection', (socket) ->
    user = new User(socket)
    socket.emit('news', { hello: 'world' })

    socket.on 'disconnect', () ->
      console.log(user.name + ' disconnected')

    socket.on 'my other event', (data) ->
      # 送信: socket.emit('my other event', { my: 'data' });
      console.log(data)
      console.log(data.my)

    socket.on 'enter', (data) ->
      console.log(data)
      room = lobby.rooms[data.roomId]
      room.addUser(user)

    socket.on 'login', (data) ->
      return if not room
      console.log(data)
      isSuccess = room.loginUser(user, data.args[0])
      res = if isSuccess then 'logged in successfully' else 'already logged in'
      socket.emit('ls', { map: res })

    socket.on 'getname', (data) ->
      console.log('getname')
      console.log(data)
      socket.emit('ls', { map: user.getNmae() })

    socket.on 'ls', (data) ->
      return if not room
      console.log(data)
      socket.emit('ls', { map: room.getStatus().map })

    socket.on 'users', (data) ->
      return if not room
      console.log(data)
      names = (u.name for u in room.users).join "\n"
      socket.emit('ls', { map: names })

    socket.on 'mv', (data) ->
      console.log(data)

    socket.on 'buid', (data) ->
      console.log(data)

    socket.on 'debug', (data) ->
      console.log('====================')
      console.log(user.name)
      console.log(user.id)
