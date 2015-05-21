'use strict'

React = require('react')
uuid = require('uuid')

{ Toolbar, Icon } = require('../components')
Control = require('react-ctrl')



class ToolbarSpec extends React.Component

  presets:
    'default':
      align: 'left'
      children: [ <Icon name="star-outline" />, <Icon name="calendar-check" />, <Icon name="dots-vertical" /> ]

  render: ->
    <Control.Component component={ Toolbar } presets={ @presets } width={ 300 } />



module.exports = ToolbarSpec
