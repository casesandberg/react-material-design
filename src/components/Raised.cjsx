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
        boxShadow: if @props.zDepth isnt '0' then "0 #{@props.zDepth}px #{@props.zDepth * 4}px rgba(0,0,0,.24)" else 'none'
        borderRadius: @props.radius
        background: @props.background

  styles: -> do @css


  render: ->
    <div is="raised">{ @props.children }</div>



module.exports = Raised
