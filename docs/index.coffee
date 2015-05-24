'use strict'

React = require('react')
Control = require('react-control')

require('../node_modules/normalize.css/normalize.css')
specs = require('../src/specs')



React.render(
  React.createElement(Control.Root, components: specs),
  document.getElementById('root')
)
