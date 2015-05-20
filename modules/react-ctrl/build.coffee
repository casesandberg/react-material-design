module.exports = (obj) ->
  tree = {}

  for key, value of obj
    tree[key] = {}
    if value.type is 'oneOf'
      for value, i in value.values
        tree[key][value] = (data) => @setState(data)
    if value.type is 'string' and value.examples?
      for example in value.examples
        tree[key][example] = (data) => @setState(data)
  tree
