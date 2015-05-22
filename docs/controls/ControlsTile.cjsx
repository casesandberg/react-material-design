'use strict'

React = require('react')
css = require('react-css')

{ Tile, Checkbox } = require('../../src/components')

_ = require('lodash')



class ControlsTile extends React.Component
  css: css.inline

  handleClick: => @props.onClick(@props.data) if @props.onClick?

  render: ->
    underlined = true if _.findWhere([@props.active], @props.data)

    <div onClick={ @handleClick }>
      <Tile condensed>
        <Checkbox marked={ underlined } />
        { @props.children }
      </Tile>
    </div>


module.exports = ControlsTile
