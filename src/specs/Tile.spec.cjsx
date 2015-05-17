'use strict'

React = require('react')

Shell = require('../../docs/controls/Shell')
{ Tile, Icon } = require('../components')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      children: [<Icon name="clock" />,<div>Content</div>]
      secondaryAction: <Icon name="arrow-right" />

  describe: ->
    'PRESET':
      'All Three': => @setState( children: [<Icon name="clock" />,<div>Content</div>], secondaryAction: <Icon name="arrow-right" />)

    'API':
      'children':
        'single': => @setState( children: 'Single-line item' )
        'sidebar': => @setState( children: [<div>sdb</div>,<div>Content</div>] )

      'props':
        'secondaryAction':
          'none': => @setState( secondaryAction: null )
          'arrow icon': => @setState( secondaryAction: <Icon name="arrow-right" /> )

  render: ->
    <Shell this={ @ } width={ 300 }>
      <Tile {...@state } />
    </Shell>



module.exports = ButtonSpec
