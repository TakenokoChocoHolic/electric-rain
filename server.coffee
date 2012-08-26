express    = require 'express'
controller = require './controller'
connection = require './connection'
Room = require('./room').Room

# Initialize express
app = express.createServer(express.logger())
app.configure ->
  app.use(express.bodyParser())
  app.use(express.methodOverride())

# Initialize controller for express
controller.start app
port = process.env.PORT or 3000
app.listen port, ->
  console.log "Listening on #{port}\nPress CTRL-C to stop server."

# Initialize game room
room = new Room()

# Initialize connection with Socket.io
connection.start app, room

setInterval ->
  room.update()
, 1000
