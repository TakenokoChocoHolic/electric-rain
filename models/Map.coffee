class Map
	constructor: (@width, @height) ->
		@map = []

	setObject: (location, obj) ->
		// NOTE override map
		@map[location.y *  height + location.x] = obj

	getObject: (obj)->
		@map[location.y * height + location.x]
	
