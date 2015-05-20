'use strict'

React = require('react')
css = require('react-css')

{ Tile } = require('../../src/components')



class ControlsTile extends React.Component
  css: css.inline

  handleClick: => @props.onClick(@props.data) if @props.onClick?

  render: ->
    <div onClick={ @handleClick }>
      <Tile>{ @props.children }</Tile>
    </div>


module.exports = ControlsTile
