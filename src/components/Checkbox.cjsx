'use strict'

React = require('react')
css = require('react-css')
Control = require('react-control')

Icon = require('./Icon')



class Checkbox extends React.Component
  css: css.inline

  @propTypes = Control.enhance
    marked: Control.PropTypes.bool.example([true, false])

  @defaultProps =
    marked: false
    color: '#4A90E2'

  constructor: (props) ->
    super props
    @state =
      marked: @props.marked

  classes: ->
    'default':
      checkbox:
        width: '18px'
        height: '18px'
        borderRadius: '2px'
        transition: 'box-shadow 100ms linear'
        position: 'relative'

      icon:
        position: 'absolute'
        top: '-12px'
        left: '-15px'

      Icon:
        fill: '#fff'

    'active':
      checkbox:
        boxShadow: 'inset 0 0 0 9px ' + @props.color

      icon:
        transform: 'rotate(0)'
        opacity: '1'
        transition: 'transform 100ms linear, opacity 100ms linear'

    'not-active':
      checkbox:
        boxShadow: 'inset 0 0 0 2px #999'
        transition: 'box-shadow 20ms linear'

      icon:
        opacity: '0'
        transform: 'rotate(-90deg)'
        transition: 'transform 1ms 100ms linear, opacity 100ms linear'

  styles: -> @css
    'active': @state.marked is true
    'not-active': @state.marked is false

  componentWillReceiveProps: (nextProps) ->
    if nextProps.marked isnt @props.marked
      @setState( marked: nextProps.marked )

  handleClick: =>
    @setState( marked: !@state.marked )

  render: ->
    <div is="checkbox" onClick={ @handleClick }>
      <div is="icon">
        <Icon is="Icon" name="checkmark-marked-deconstructed" />
      </div>
    </div>



module.exports = Checkbox
