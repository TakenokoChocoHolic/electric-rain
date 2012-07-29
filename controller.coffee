url = if process.env.PORT then "http://electric-rain-8443.herokuapp.com/" else "http://localhost"

exports.start = (app) ->
  app.get '/', (req, res) ->
    res.render('index.ejs', {locals:{msg:'hello', url:url}})
