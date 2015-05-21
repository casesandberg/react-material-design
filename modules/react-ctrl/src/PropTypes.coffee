
PropTypes = -> @


PropTypes.string = ->
  @type = 'string'
  @

PropTypes.string.example = (array) ->
  @examples = array
  @



PropTypes.oneOf = (array) ->
  @type = 'oneOf'
  @value = array
  @

PropTypes.oneOf().example = (array) ->
  @examples = array
  @


module.exports = PropTypes
