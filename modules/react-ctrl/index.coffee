
Control = {}

# Control.Component = require('./Control')
Control.build = require('./build')
Control.PropTypes = require('./src/PropTypes')

Control.enhance = (obj) ->
  obj

module.exports = Control
