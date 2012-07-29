class Engine
  constructor: () ->
  getStatus: () ->
    {
      map: '....\n....\n....\n..o.\n',
      cards: [ {kind: 1} ]
    }
  mv: (data) -> true
  build: (data) -> true

exports.Engine = Engine
