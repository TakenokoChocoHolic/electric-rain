shuffle = (array) ->
  top = array.length
  if top
    while --top
      current = Math.floor(Math.random() * (top + 1))
      tmp = array[current]
      array[current] = array[top]
      array[top] = tmp
  array

clone = (obj) ->
  # Handle the 3 simple types, and null or undefined
  return obj if null == obj or "object" != typeof obj

  # Handle Date
  if obj instanceof Date
    copy = new Date()
    copy.setTime(obj.getTime())
    return copy

  # Handle Array
  if obj instanceof Array
    copy = []
    for o in obj
      copy.push(clone(o))
    return copy

  # Handle Object
  if obj instanceof Object
    copy = {}
    for attr of obj
      if obj.hasOwnProperty(attr)
        copy[attr] = clone(obj[attr])
    return copy

  throw new Error("Unable to copy obj! Its type isn't supported.")

exports.shuffle = shuffle
exports.clone = clone
