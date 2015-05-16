merge = require('merge')
React = require('react')
_ = require('lodash')

autoIncludedClasses = ['default']

###
CSS in React
###
css = (styles) -> _css(styles)
css.merge = (styles) -> _merge(styles)
css.replace = (css, customFuncs) -> _replace(css, customFuncs)
css.resolve = -> _resolve.apply @, arguments
# css.mixin is down below


###
Inline CSS function. This is the half-way point until multiple inheritance exists
@param declaredClasses: Object{ 'class-name': true / false }
@returns object
###
css.inline = (declaredClasses) ->
  arrayOfStyles = []

  if not @classes? then throw console.warn "Make sure you have this.classes defined on `#{ @constructor.displayName }`"

  pushStyle = (name, options) =>
    if @classes()[name]?
      arrayOfStyles.push(@classes()[name])
    else if name and options?.warn is true
      console.warn "The class `#{name}` does not exist on `#{@constructor.displayName}`"

  pushStyle(name) for name in autoIncludedClasses

  pushStyle(name, warn:true) for name, condition of declaredClasses when condition is true

  for key, value of @props?.style
    if key is 'class'
      pushStyle(name, warn:true) for name in value.split(' ')

    else
      console.warn "You shouldnt be defining CSS for children components in `#{ @constructor.displayName }`, please pass down a class name instead."
      arrayOfStyles.push({ "#{ key }": value })

  return _css(arrayOfStyles)



###
Do all the css things
@param styles: An array of style objects
@returns object
###
_css = (styles) ->
  merged = _merge(styles)
  return _replace(merged)



###
Step through a style object and replace any custom properties as defined
@param styleObject: An object of styles
@returns object
###
_replace = (styleObject, customFuncs) ->

  # These custom props will eventually live in a file or config somewhere
  customProps = customProps || customFuncs || replaceProps || {}
  replaced = {}

  for key, value of styleObject

    # If its an object
    if typeof value is 'object' and not Array.isArray(value)
      # Lets go ahead and run again
      replaced[key] = _replace(value, customFuncs)

    else
      # Check to see if a custom prop exists for it
      if customProps[key]?

        for newKey, newValue of customProps[key](value)
          replaced[newKey] = newValue

      # If not, just copy it as-is
      else
        replaced[key] = value


  return replaced



###
Merges an array of objects together
@param thingsToBeMerged: An array of things to be merged
@returns object
###
_merge = (thingsToBeMerged) ->

  # If its an object, lets just return it
  if typeof thingsToBeMerged is 'object' and not Array.isArray(thingsToBeMerged)
    return thingsToBeMerged

  # If the array only has one object in it, return it
  if thingsToBeMerged.length is 1
    return thingsToBeMerged[0]

  # Else, lets just use the merge.js function:
  return merge.recursive.apply @, thingsToBeMerged



###
Look through any number of arguments and always returns the last one defined.
@param defaultValue: The default "base" value
@param possibleValues...: Unlimited number of function arguments
@returns object
###
_resolve = (defaultValue, possibleValues...) ->
  valueToReturn = defaultValue

  for possibleValue in possibleValues
    if possibleValue
      valueToReturn = possibleValue

  return valueToReturn



###
React mixin that handles checking of all of the components styles and applies
any styles passed down via props.styles
@param defaultValue: The default "base" value
@param possibleValues...: Unlimited number of function arguments
@returns object
###
css.mixin =
  css: (activeStyleNames...) ->
    arrayOfStyles = []

    # Check for classes first
    if @classes? and activeStyleNames

      ###
      TESTING THIS FROM ConversationColumn.cjsx
      ###
      # If there are any breakpoints active
      if @currentBound?
        activeStyleNames.push(@currentBound())

      # If there are styles passed down
      if @props?.style?.class

        # And props.style is an array, lets combine them
        # if Array.isArray(@props.style)
        #   activeStyleNames = activeStyleNames.concat(@props.style)


        if typeof @props.style?.class is 'string'

          # if its multiple classes, then lets combine it
          if @props.style?.class.indexOf(' ') isnt -1
            activeStyleNames = activeStyleNames.concat(@props.style?.class.split(' '))

          else
            # if its a string, lets just push it
            activeStyleNames.push(@props.style.class)

      # Iterate through the style names
      for styleName in activeStyleNames

        # If the style actually exists, lets add it to the array
        if @classes()[styleName]
          arrayOfStyles.push(@classes()[styleName])
        # If the lookup fails, let the dev know
        else if styleName
          console.warn "The class `#{styleName}` does not exist on `#{@constructor.displayName}`"

      # Quick fix for bleeding css
      if _.omit(@props?.style, 'class')
        arrayOfStyles.push(_.omit(@props?.style, 'class'))

    else
      console.warn 'Make sure you have classes defined under this.classes in
                    your component'

    # Pass the array to the CSS method
    return _css(arrayOfStyles)



###
Custom Props for the _replace function
These custom props will eventually live in a file or config somewhere
###
replaceProps =
  borderRadius: (value) ->
    msBorderRadius: value
    MozBorderRadius: value
    OBorderRadius: value
    WebkitBorderRadius: value
    borderRadius: value

  boxShadow: (value) ->
    msBoxShadow: value
    MozBoxShadow: value
    OBoxShadow: value
    WebkitBoxShadow: value
    boxShadow: value

  transition: (value) ->
    msTransition: value
    MozTransition: value
    OTransition: value
    WebkitTransition: value
    transition: value

  Absolute: (value) ->
    direction = value.split(" ")

    position: 'absolute'
    top: direction[0]
    right: direction[1]
    bottom: direction[2]
    left: direction[3]


# Export it all
module.exports = css



# Stupid hack until I get gulp amd to work
define = ->
