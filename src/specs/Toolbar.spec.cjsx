'use strict'

React = require('react')
uuid = require('uuid')

{ Toolbar, Icon } = require('../components')
Control = require('../../modules/react-control/src/components/Control')



class ToolbarSpec extends React.Component

  presets:
    'default':
      align: 'justify'
      children: [ <Icon name="star-outline" />, <Icon name="calendar-check" />, <Icon name="dots-vertical" /> ]

  render: ->
    <Control component={ Toolbar } presets={ @presets } width={ 300 } />



module.exports = ToolbarSpec
