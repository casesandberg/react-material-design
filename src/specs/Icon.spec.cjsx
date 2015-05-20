'use strict'

React = require('react')
uuid = require('uuid')

{ Icon } = require('../components')
Control = require('react-ctrl')



class IconSpec extends React.Component

  presets:
    'default':
      name: 'arrow-right'

  render: ->
    <Control component={ Icon } presets={ @presets } />



module.exports = IconSpec
