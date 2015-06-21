'use strict'

React = require('react')
css = require('react-css')

Icon = require('./Icon')



class Slider extends React.Component
  css: css.inline

  @propTypes =
    type: React.PropTypes.string

  @propExamples =
    type:
      type: 'string'
      like: ['continuous', 'discrete']

  @defaultProps =
    type: 'continuous'

  constructor: (props) ->
    super props
    @state =
      active: false

  classes: ->
    'default':
      slider:
        height: '12px'
        position: 'relative'
        padding: '1px 0'

      bar:
        height: '2px'
        width: '100%'
        background: '#999'
        margin: '4px 0'

      circle:
        width: '12px'
        height: '12px'
        borderRadius: '50%'
        background: '#fff'
        boxShadow: 'inset 0 0 0 2px #999'
        position: 'absolute'
        top: '0'

    'active':
      circle:
        transform: 'scale(1.5)'
        boxShadow: 'inset 0 0 0 2px #999'

    'left':
      left:
        width: '24px'
        height: '24px'
        marginRight: '20px'

    'right':
      right:
        width: '24px'
        height: '24px'
        marginLeft: '20px'

  styles: -> @css
    'active': @state.active

  handleClick = (e) =>
    console.log e
    if e.type is 'mousedown'
      @setState( active: true )

    if e.type is 'mouseup'
      @setState( active: true )

  render: ->
    <div is="slider">
      <div is="bar" />
      <div is="circle" onMouseDown={ @handleClick } onMouseUp={ @handleClick }/>
    </div>



module.exports = Slider
