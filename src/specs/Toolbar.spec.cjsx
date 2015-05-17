'use strict'

React = require('react')
uuid = require('uuid')

Shell = require('../../docs/controls/Shell')
{ Toolbar, Icon } = require('../components')



class ToolbarSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      align: 'left'
      children: [ <Icon name="clock" />, <Icon name="clock" />, <Icon name="clock" /> ]

  describe: =>
    'PROPS':
      'align':
        'left': => @setState( align: 'left' )
        'right': => @setState( align: 'right' )
        'justify': => @setState( align: 'justify' )

  render: ->
    <Shell this={ @ } width={ 300 }>
      <Toolbar {...@state } />
    </Shell>



module.exports = ToolbarSpec
