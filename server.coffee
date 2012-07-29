express    = require 'express'
controller = require './controller'
connection = require './connection'
Engine = require('./engine').Engine

app = express.createServer(express.logger())
app.configure ->
  app.use(express.bodyParser())
  app.use(express.methodOverride())

controller.start app
port = process.env.PORT or 3000
app.listen port, ->
  console.log "Listening on #{port}\nPress CTRL-C to stop server."

engine = new Engine()

connection.start app, engine

setInterval ->
  engine.update()
, 1000
