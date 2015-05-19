'use strict'

React = require('react')

Shell = require('../../docs/controls/Shell')
{ Tabs } = require('../components')



class TabsSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      children: [ 'foo', 'bar', 'longer' ]
      width: 340


  describe: ->
    'PRESET':
      'fixed mobile': => @setState( children: [ 'foo', 'bar', 'longer' ], width: 340 )
      'left desktop': => @setState( children: [ 'foo', 'bar', 'way longer' ], width: 640, align: 'left' )

    'API':
      'children':
        '2': => @setState( children: [ 'foo', 'bar'] )
        '3': => @setState( children: [ 'foo', 'bar', 'longer'] )
        '5': => @setState( children: [ 'foo', 'bar', 'way longer', 'bar', 'foo' ] )

      'align':
        'fixed (default)': => @setState( align: undefined )
        'left': => @setState( align: 'left' )
        'center': => @setState( align: 'center' )

  render: ->
    <Shell this={ @ } width={ @state.width }>
      <Tabs {...@state } />
    </Shell>



module.exports = TabsSpec
