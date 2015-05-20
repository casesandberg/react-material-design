'use strict'

React = require('react')
css = require('react-css')


Raised = require('./Raised')



class Button extends React.Component
  css: css.inline

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

  @propTypes =
    type: React.PropTypes.oneOf(['raised', 'flat', 'floating-action'])
    label: React.PropTypes.string
    background: React.PropTypes.string
    zDepth: React.PropTypes.oneOf(['0', '1', '2', '3', '4', '5', 0, 1, 2, 3, 4, 5])

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
