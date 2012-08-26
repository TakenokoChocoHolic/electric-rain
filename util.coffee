_ = require 'underscore'

shuffle = (array) ->
  _.shuffle(array)

clone = (obj) ->
  _.clone obj

charList = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
randomChar = (len) ->
  randInt = (max) ->
    Math.floor(Math.random()*max)
  (charList[randInt(charList.length)] for i in [1..len]).join('')

exports.shuffle = shuffle
exports.clone = clone
exports.randomChar = randomChar
