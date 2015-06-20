'use strict'

React = require('react')
Control = require('react-harness')

require('../node_modules/normalize.css/normalize.css')
specs = require('../src/specs')

specs.GoogleMaps = require('../examples/google-maps/controls/GoogleMaps.control')



React.render(
  React.createElement(Control.Root, components: specs),
  document.getElementById('root')
)
