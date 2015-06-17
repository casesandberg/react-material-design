'use strict'

React = require('react')

GoogleMaps = require('../components/GoogleMaps')
Control = require('../../../modules/react-control/src/components/Control')



class ControlGoogleMaps extends React.Component

  presets:
    'default':
      name: 'Bi-Rite Market'

  render: ->
    <Control component={ GoogleMaps } presets={ @presets } />



module.exports = ControlGoogleMaps
