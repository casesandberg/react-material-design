'use strict'

React = require('react')
css = require('react-css')

{ Tile } = require('../../src/components')

_ = require('lodash')



class ControlsTile extends React.Component
  css: css.inline

  handleClick: => @props.onClick(@props.data) if @props.onClick?

  render: ->
    # console.log @props.active
    # console.log @props.data

    underlined = true if _.findWhere([@props.active], @props.data)

    <div onClick={ @handleClick } style={ textDecoration: 'underline' if underlined }>
      <Tile>{ @props.children }</Tile>
    </div>


module.exports = ControlsTile
