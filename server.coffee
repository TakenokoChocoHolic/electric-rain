express    = require 'express'
controller = require './controller'
connection = require './connection'
Lobby = require('./lobby').Lobby

# Initialize express
app = express.createServer(express.logger())
app.configure ->
  app.use(express.bodyParser())
  app.use(express.methodOverride())

# Initialize game room
lobby = new Lobby()

# Initialize controller for express
controller.start app, lobby
port = process.env.PORT or 3000
app.listen port, ->
  console.log "Listening on #{port}\nPress CTRL-C to stop server."

# Initialize connection with Socket.io
connection.start app, lobby

setInterval ->
  lobby.update()
, 1000
