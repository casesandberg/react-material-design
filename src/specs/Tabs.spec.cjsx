'use strict'

React = require('react')

{ Tabs, Raised } = require('../components')
Control = require('../../modules/react-control/Control')



context =
  primaryColor: '#2196F3'
  accentColor: '#E91E63'
  theme: 'light'



class TabsSpec extends React.Component

  presets:
    'default':
      children: [ 'foo', 'bar', 'longer' ]
      width: 340
      align: undefined

    'left desktop':
      children: [ 'foo', 'bar', 'way longer' ]
      width: 640
      align: 'left'

  render: ->
    <Control component={ Tabs } wrapper={[ Raised, {background: context.primaryColor, square: true} ]} presets={ @presets } />



module.exports = TabsSpec
