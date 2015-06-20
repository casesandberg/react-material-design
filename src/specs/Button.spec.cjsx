'use strict'

React = require('react')
uuid = require('uuid')

{ Button } = require('../components')
Control = require('react-harness')



class ButtonSpec extends React.Component

  presets:
    'default':
      label: 'Button'
      # background: '#2196f3'
      color: '#2196f3'

    'Big Black Button':
      type: 'raised'
      label: 'SUCH A BIG BUTTON'
      # background: '#333'
      color: '#333'

  render: ->
    <Control component={ Button } presets={ @presets } />



module.exports = ButtonSpec
