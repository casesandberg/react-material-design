'use strict'

React = require('react')

Tile = require('../components/Tile')
Shell = require('../../docs/controls/Shell')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      children: [<div>sdb</div>,<div>content</div>]
      secondaryAction: <div>f</div>

  describe: ->
    'PRESET':
      'All Three': => @setState( children: [<div>sdb</div>,<div>content</div>], secondaryAction: <div>f</div>)

    'API':
      'children':
        'single': => @setState( children: 'Single-line item' )
        'sidebar': => @setState( children: [<div>sdb</div>,<div>content</div>] )

      'props':
        'secondaryAction':
          'none': => @setState( secondaryAction: null )
          'f icon': => @setState( secondaryAction: <div>f</div> )

  render: ->
    <Shell this={ @ } width={ 300 }>
      <Tile {...@state } />
    </Shell>



module.exports = ButtonSpec
