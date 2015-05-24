'use strict'

React = require('react')
css = require('react-css')
Control = require('react-control')

Raised = require('./Raised')



class Button extends React.Component
  css: css.inline

  @propTypes = Control.enhance
    type: Control.PropTypes.oneOf(['raised', 'flat', 'floating-action']).example(['raised', 'flat', 'floating-action'])
    label: Control.PropTypes.string.example(['Button', 'Save \& Activate', 'Post to Facebook'])
    background: Control.PropTypes.string.example(['#2196f3', '#aeee00', '#333'])
    zDepth: Control.PropTypes.oneOf(['0', '1', '2', '3', '4', '5', 0, 1, 2, 3, 4, 5]).example(['0', '1', '2', '3', '4', '5'])

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

    <Raised is="Raised">
      <div is="button">
        { if @props.type isnt 'floating-action'
            @props.label
          else
            '+' }
      </div>

    </Raised>


module.exports = Button
