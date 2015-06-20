'use strict'

React = require('react')

GoogleMaps = require('../components/GoogleMaps')
Control = require('react-harness')



class ControlGoogleMaps extends React.Component

  presets:
    'default':
      name: 'Bi-Rite Market'

  render: ->
    <Control component={ GoogleMaps } presets={ @presets } />



module.exports = ControlGoogleMaps
