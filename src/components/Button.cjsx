'use strict'

React = require('react')

Raised = require('./Raised')



class Button extends React.Component

  @defaultProps =
    type: 'raised'
    zDepth: '1'

  styles: ->
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

    action:
      width: '56px'
      height: '56px'




  render: ->
    # if @props.type is 'flat' and @props.zDepth? and @props.zDepth isnt '0'
    #   console.log '`Button` components that have a type of `flat` should not have a `zDepth`'

    <Raised background={ @props.background if @props.type isnt 'flat' } zDepth={ if @props.type is 'flat' then '0' else @props.zDepth }>
      { if @props.type isnt 'floating-action'
          <div is="button">{ @props.label }</div>
        else
          <div is="action"> + </div> }

    </Raised>



module.exports = Button
