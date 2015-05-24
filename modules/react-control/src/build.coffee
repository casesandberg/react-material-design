module.exports = (obj) ->
  tree = {}

  for key, value of obj
    tree[key] = {}

    if value.like.length

      for thing in value.like
        tree[key][thing] = (data) => @setState(data)

  tree
