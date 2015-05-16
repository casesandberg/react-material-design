'use strict'

React = require('react')
css = require('react-css')


class Raised extends React.Component
  css: css.inline

  @defaultProps =
    radius: '2px'
    zDepth: '1'

  classes: ->
    'default':
      raised:
        boxShadow: "0 #{ @props.zDepth }px #{ @props.zDepth * 4 }px rgba(0,0,0,.24)"
        borderRadius: @props.radius
        background: @props.background

    'no-box-shadow':
      raised:
        boxShadow: 'none'

  styles: -> @css
    'no-box-shadow': @props.zDepth is '0'


  render: ->
    <div is="raised">{ @props.children }</div>



module.exports = Raised
