Array::shuffle = () ->
  array = this
  top = array.length
  if top
    while --top
      current = Math.floor(Math.random() * (top + 1))
      tmp = array[current]
      array[current] = array[top]
      array[top] = tmp
  array
