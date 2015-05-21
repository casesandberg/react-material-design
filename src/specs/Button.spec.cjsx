'use strict'

React = require('react')
uuid = require('uuid')

{ Button } = require('../components')
Control = require('../../modules/react-ctrl/Control')



class ButtonSpec extends React.Component

  presets:
    'default':
      # label: 'Button'
      # background: '#2196f3'
      color: '#fff'

      type: 'foo'
      label: false
      background: true
      zDepth: 'big'

    'Big Black Button':
      type: 'raised'
      label: 'SUCH A BIG BUTTON'
      background: '#333'
      color: '#fff'

  render: ->
    console.log JSON.stringify Button.propTypes.controlProps(), null, 2
    <Control component={ Button } presets={ @presets } />



module.exports = ButtonSpec
