'use strict'

React = require('react')



class Raised extends React.Component

  @defaultProps =
    radius: '2px'
    zDepth: '1'

  styles: ->
    raised:
      boxShadow: if @props.zDepth isnt '0' then "0 #{@props.zDepth}px #{@props.zDepth * 4}px rgba(0,0,0,.24)" else 'none'
      borderRadius: @props.radius
      background: @props.background

  render: ->
    console.log @props.zDepth
    <div style={ @styles().raised }>{ @props.children }</div>



module.exports = Raised
