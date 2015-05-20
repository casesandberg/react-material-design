'use strict'

React = require('react')
uuid = require('uuid')

Shell = require('../../docs/controls/Shell')
{ Toolbar, Icon } = require('../components')

build = require('../../docs/controls/sidebar')



class ToolbarSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      align: 'left'
      children: [ <Icon name="star-outline" />, <Icon name="calendar-check" />, <Icon name="dots-vertical" /> ]

  describe: =>
    # 'PROPS':
    #   'align':
    #     'left': => @setState( align: 'left' )
    #     'right': => @setState( align: 'right' )
    #     'justify': => @setState( align: 'justify' )

    'API': => build.call(@, Toolbar.expectedProps)

  render: ->
    <Shell this={ @ } width={ 300 }>
      <Toolbar {...@state } />
    </Shell>



module.exports = ToolbarSpec
