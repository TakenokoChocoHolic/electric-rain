exports.start = (app) ->
  io = require('socket.io').listen(app)

  io.sockets.on 'connection', (socket) ->
    socket.emit('news', { hello: 'world' })
    # $B<u?.$9$kL?Na$N0lMw(B
    socket.on 'my other event', (data) ->
      # $BAw?.(B: socket.emit('my other event', { my: 'data' });
      console.log(data)
      console.log(data.my)
    socket.on 'ls', (data) ->
      console.log(data)
      socket.emit('ls', { map: '....\n....\n....\n....\n' })
    socket.on 'mv', (data) ->
      console.log(data)
    socket.on 'buid', (data) ->
      console.log(data)
