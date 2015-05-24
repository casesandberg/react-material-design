'use strict'

React = require('react')

{ Slider } = require('../components')
Control = require('../../modules/react-control/src/components/Control')



class SliderSpec extends React.Component

  presets:
    'default':
      marked: false

  render: ->
    <Control component={ Slider } presets={ @presets } width={ 200 } />



module.exports = SliderSpec
