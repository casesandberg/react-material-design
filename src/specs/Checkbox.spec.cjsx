'use strict'

React = require('react')
uuid = require('uuid')

{ Checkbox } = require('../components')
Control = require('../../modules/react-control/Control')



class CheckboxSpec extends React.Component

  presets:
    'default':
      marked: false

  render: ->
    <Control component={ Checkbox } presets={ @presets } />



module.exports = CheckboxSpec
