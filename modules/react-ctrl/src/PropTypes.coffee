
PropTypes = =>


PropTypes.string = ->
  type: 'string'

PropTypes.string.example = (array) ->
  type: 'string'
  examples: array


PropTypes.array = ->
PropTypes.array.example = (array) ->
  type: 'array'
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

# PropTypes.oneOf().example().done = (react, stuff, here, returnObj) ->
#   if react or stuff or here
#     console.log 'REACT'
#
#   else
#     console.log 'RETURN'
#
#
#   type: 'oneOf'
#   value: true
#   examples: ['foo']

module.exports = PropTypes
