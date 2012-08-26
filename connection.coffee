User = require('./user').User

exports.start = (app, engine) ->
  io = require('socket.io').listen(app)

  io.sockets.on 'connection', (socket) ->
    user = new User(socket)
    engine.addUser(user)
    socket.emit('news', { hello: 'world' })

    socket.on 'disconnect', () ->
      console.log(user.name + ' disconnected')

    socket.on 'my other event', (data) ->
      # 送信: socket.emit('my other event', { my: 'data' });
      console.log(data)
      console.log(data.my)

    socket.on 'login', (data) ->
      console.log(data)
      isSuccess = engine.loginUser(user, data.args[0])
      res = if isSuccess then 'logged in successfully' else 'already logged in'
      socket.emit('ls', { map: res })

    socket.on 'getname', (data) ->
      console.log('getname')
      console.log(data)
      socket.emit('ls', { map: user.getNmae() })

    socket.on 'ls', (data) ->
      console.log(data)
      socket.emit('ls', { map: engine.getStatus().map })

    socket.on 'users', (data) ->
      console.log(data)
      names = (user.name for user in engine.users).join "\n"
      socket.emit('ls', { map: names })

    socket.on 'mv', (data) ->
      console.log(data)

    socket.on 'buid', (data) ->
      console.log(data)

    socket.on 'debug', (data) ->
      console.log('====================')
      console.log(user.name)
      console.log(user.id)
