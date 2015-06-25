'use strict'

React = require('react')

{ Tabs, Raised } = require('../components')
Control = require('react-harness')



context =
  primaryColor: '#2196F3'
  accentColor: '#E91E63'
  theme: 'light'



class TabsSpec extends React.Component

  presets:
    'default':
      tabs: [
        label: 'cool'
        onClick: -> console.log 'cool'
      ,
        label: 'tabs'
        onClick: -> console.log 'tabs'
      ]
      width: 340
      align: 'justify'
      background: context.primaryColor

    'second not selectable':
      tabs: [
        label: 'cool'
        onClick: -> console.log 'cool'
      ,
        label: 'tabs'
        onClick: -> console.log 'tabs'
        selectable: false
      ,
        label: 'bar'
        onClick: -> console.log 'bar'
      ]
      width: 340
      align: 'justify'
      background: context.primaryColor

    'second selected':
      tabs: [
        label: 'cool'
        onClick: -> console.log 'cool'
      ,
        label: 'tabs'
        onClick: -> console.log 'tabs'
      ]
      width: 340
      align: 'justify'
      background: context.primaryColor
      selectedTab: 1

    'three (mobile)':
      tabs: [ 'foo', 'bar', 'longer' ]
      width: 340
      align: 'justify'
      background: context.primaryColor

    'left desktop':
      tabs: [ 'foo', 'bar', 'way longer' ]
      width: 640
      align: 'left'

  render: ->
    <Control component={ Tabs } presets={ @presets } />



module.exports = TabsSpec
