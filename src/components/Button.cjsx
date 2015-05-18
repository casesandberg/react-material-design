'use strict'

React = require('react')
css = require('react-css')


Raised = require('./Raised')



class Button extends React.Component
  css: css.inline

  @propTypes =
    style: React.PropTypes.shape
      color: React.PropTypes.string
      background: React.PropTypes.string

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
        color: @props.style?.color

      Raised:
        background: @props.style?.background

    'circular-with-icon':
      Raised:
        class: 'circle'

      button:
        width: '56px'
        height: '56px'
        padding: '0'
        # placeholder
        color: '#fff'
        fontSize: '24px'


  styles: -> @css
    'circular-with-icon': @props.type is 'floating-action'
    'public': true





  render: ->
    # if @props.type is 'flat' and @props.zDepth? and @props.zDepth isnt '0'
    #   console.log '`Button` components that have a type of `flat` should not have a `zDepth`'

    <Raised is="Raised" background={ @props.background if @props.type isnt 'flat' } zDepth={ if @props.type is 'flat' then '0' else @props.zDepth }>
      <div is="button">
        { if @props.type isnt 'floating-action'
            @props.label
          else
            '+' }
      </div>

    </Raised>



module.exports = Button
