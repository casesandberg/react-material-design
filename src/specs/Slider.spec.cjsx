'use strict'

React = require('react')
uuid = require('uuid')

{ Slider } = require('../components')
Control = require('../../modules/react-ctrl/Control')



class SliderSpec extends React.Component

  presets:
    'default':
      marked: false

  render: ->
    <Control component={ Slider } presets={ @presets } width={ 200 } />



module.exports = SliderSpec
