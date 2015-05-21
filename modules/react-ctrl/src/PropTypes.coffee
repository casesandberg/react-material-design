
PropTypes = =>


PropTypes.string = ->
  type: 'string'

PropTypes.string.example = (array) ->
  type: 'string'
  examples: array



PropTypes.oneOf = (array) =>
  # Eventually fix this, defaulting to adding example for now
  @type = 'oneOf'
  @value = array
  # console.log @
  @

PropTypes.oneOf().example = (array) ->
  type: 'oneOf'
  value: @value
  examples: array


module.exports = PropTypes
