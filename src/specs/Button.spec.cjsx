'use strict'

React = require('react')
uuid = require('uuid')

{ Button } = require('../components')
Control = require('../../modules/react-control/Control')



class ButtonSpec extends React.Component

  presets:
    'default':
      label: 'Button'
      background: '#2196f3'
      color: '#fff'

    'Big Black Button':
      type: 'raised'
      label: 'SUCH A BIG BUTTON'
      background: '#333'
      color: '#fff'

  render: ->
    <Control component={ Button } presets={ @presets } />



module.exports = ButtonSpec
