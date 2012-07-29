exports.start = (app) ->
  app.get '/', (req, res) ->
    res.render('index.ejs', {locals:{msg:'hello'}})
