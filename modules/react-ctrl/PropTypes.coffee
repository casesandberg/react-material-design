
PropTypes =
  oneOf: -> React.PropTypes.oneOf.call( arguments ); arguments[0]
  string: -> console.log 'string'; @

PropTypes.string.example = -> console.log arguments[0]


module.exports = PropTypes
