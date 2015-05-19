'use strict'

React = require('react')

Shell = require('../../docs/controls/Shell')
{ Tabs, Raised } = require('../components')


context =
  primaryColor: '#2196F3'
  accentColor: '#E91E63'
  theme: 'light'


class TabsSpec extends React.Component



  constructor: (props) ->
    super props
    @state =
      children: [ 'foo', 'bar', 'longer' ]
      width: 340
      onSelect: (tab) => @changeTab(tab)
      # style:
      #   indicatorColor: context.accentColor
      #   activeLabelColor: context.accentColor

  changeTab: (tab) => @setState( selectedTab: tab )


  describe: ->
    'PRESET':
      'fixed mobile': => @setState( children: [ 'foo', 'bar', 'longer' ], width: 340, align: undefined)
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
      <Raised style={ background: context.primaryColor, class: 'square' } >
        <Tabs {...@state } />
      </Raised>
    </Shell>



module.exports = TabsSpec
