'use strict'

React = require('react')

Tile = require('../components/Tile')
Shell = require('../../docs/controls/Shell')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      children: 'Single-line item'

  describe: ->
    'children':
      'single': => @setState( children: 'Single-line item' )
      'sidebar': => @setState( children: [<div>sidebar</div>,<div>content</div>] )

  render: ->
    <Shell this={ @ } width={ 200 }>
      <Tile {...@state } />
    </Shell>



module.exports = ButtonSpec
