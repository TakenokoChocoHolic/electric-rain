exports.start = (app) ->
  io = require('socket.io').listen(app)

  io.sockets.on 'connection', (socket) ->
    socket.emit('news', { hello: 'world' })
    socket.on 'my other event', (data) ->
      console.log(data)
