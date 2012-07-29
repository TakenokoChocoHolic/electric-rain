exports.start = (app) ->
  io = require('socket.io').listen(app)

  io.sockets.on 'connection', (socket) ->
    socket.emit('news', { hello: 'world' })
    # 受信する命令の一覧
    socket.on 'my other event', (data) ->
      # 送信: socket.emit('my other event', { my: 'data' });
      console.log(data)
      console.log(data.my)
    socket.on 'ls', (data) ->
      console.log(data)
      socket.emit('ls', { map: '....\n....\n....\n....\n' })
    socket.on 'mv', (data) ->
      console.log(data)
    socket.on 'buid', (data) ->
      console.log(data)
