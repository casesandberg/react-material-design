'use strict'

React = require('react')
css = require('react-css')

Control = require('react-ctrl')

Raised = require('./Raised')



class Button extends React.Component
  css: css.inline

  # Change this to proper chaining

  # Control = ->
  # Control.PropTypes = ->
  # Control.PropTypes.oneOf = ->
  #   @type = 'oneOf'
  #   @value = arguments[0]
  #   @
  #
  # Control.PropTypes.oneOf().example = ->
  #   @examples = arguments[0]
  #   @
  #
  Control.enhance = (obj) ->
    exported = {}

    console.log obj

    for prop, propType of obj
      # console.log prop, propType.type
      exported[prop] = propType.examples || propType.value

      if propType.value
        propType = React.PropTypes[propType.type](propType.value)
      else
        propType = React.PropTypes[propType.type]


    obj.controlProps = -> exported
    obj

  # Control.PropTypes.string.example = -> ###console.log arguments[0];### @
  # Control.PropTypes.oneOf().example = -> ###console.log arguments[0];### @

  @expectedProps =
    type:
      type: 'oneOf'
      values: ['raised', 'flat', 'floating-action']

    zDepth:
      type: 'oneOf'
      values: ['0', '1', '2', '3', '4', '5'] # 0, 1, 2, 3, 4, 5

    label:
      type: 'string'
      examples: ['Button', 'Save \& Activate', 'Post to Facebook']

    background:
      type: 'string'
      examples: ['#2196f3', '#aeee00', '#333']

  @propTypes = Control.enhance
    type: Control.PropTypes.oneOf(['raised', 'flat', 'floating-action'])
    label: Control.PropTypes.string.example(['Button', 'Save \& Activate', 'Post to Facebook'])
    background: Control.PropTypes.string.example(['#2196f3', '#aeee00', '#333'])
    zDepth: Control.PropTypes.oneOf(['0', '1', '2', '3', '4', '5', 0, 1, 2, 3, 4, 5]).example(['0', '1', '2', '3', '4', '5'])

  # @propTypes = Control.enhance
  #   type: Control.PropTypes.oneOf(['raised', 'flat', 'floating-action'])
  #   label: React.PropTypes.string
  #   background: React.PropTypes.string
  #   zDepth: React.PropTypes.oneOf(['0', '1', '2', '3', '4', '5', 0, 1, 2, 3, 4, 5])

  @defaultProps =
    type: 'raised'
    zDepth: '1'

  classes: ->
    'default':
      button:
        minWidth: '48px' # 64 minus 8*2
        padding: '0 8px'
        height: '36px'
        lineHeight: '36px'
        textAlign: 'center'
        fontSize: '14px'
        textTransform: 'uppercase'
        fontWeight: '500'
        WebkitFontSmoothing: 'antialiased'
        color: @props.color

    'public':
      button:
        color: @props.color

      Raised:
        background: if @props.type isnt 'flat' then @props.background
        zDepth: if @props.type is 'flat' then '0' else @props.zDepth

    'type-floating-action':
      Raised:
        circle: true

      button:
        width: '56px'
        height: '56px'
        padding: '0'
        # placeholder
        color: '#fff'
        fontSize: '24px'

  styles: -> @css()

  render: ->
    # console.log Control.PropTypes
    # if @props.type is 'flat' and @props.zDepth? and @props.zDepth isnt '0'
    #   console.log '`Button` components that have a type of `flat` should not have a `zDepth`'

    # <Raised is="Raised">
    #   <div is="button">
    #     { if @props.type isnt 'floating-action'
    #         @props.label
    #       else
    #         '+' }
    #   </div>
    #
    # </Raised>

    <div>button</div>



module.exports = Button
