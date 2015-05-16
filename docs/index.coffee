'use strict'

React = require('react')

require('../node_modules/normalize.css/normalize.css')

Button = require('../src/specs/Button.spec')

Root = require('./controls/Root')

# specs = require('../src/specs')
#
# for name, specComponent of specs
#   console.log name

React.render(
  React.createElement(Root),
  document.getElementById('root')
)
