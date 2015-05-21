React = require('react')

module.exports = (obj) ->
  lookup = {}
  newObj = {}

  for prop, propType of obj

    if propType.value
      lookup[prop] = propType.examples
      newObj[prop] = React.PropTypes[propType.type](propType.examples)

    else
      lookup[prop] = propType.examples
      newObj[prop] = React.PropTypes[propType.type]

  newObj.controlProps = -> lookup
  newObj
