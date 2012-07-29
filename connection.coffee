User = require('./user').User

exports.start = (app, engine) ->
  io = require('socket.io').listen(app)

  io.sockets.on 'connection', (socket) ->
    user = new User(socket)
    socket.emit('news', { hello: 'world' })

    socket.on 'my other event', (data) ->
      # 送信: socket.emit('my other event', { my: 'data' });
      console.log(data)
      console.log(data.my)

    socket.on 'login', (data) ->
      console.log(data)
      user.setName(data.args[0])

    socket.on 'getname', (data) ->
      console.log('getname')
      console.log(data)
      socket.emit('ls', { map: user.getNmae() })

    socket.on 'ls', (data) ->
      console.log(data)
      socket.emit('ls', { map: engine.getStatus().map })

    socket.on 'mv', (data) ->
      console.log(data)

    socket.on 'buid', (data) ->
      console.log(data)
