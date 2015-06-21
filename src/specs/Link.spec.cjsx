'use strict'

React = require('react')

{ Link } = require('../components')
Control = require('react-harness')



module.exports = class LinkSpec extends React.Component

  presets:
    'default':
      children: 'Log to Console'
      onClick: -> console.log 'HELLO'

    'Outbound Link':
      children: 'Some Link'
      onClick: 'http://some.url/'
      newTab: true

  render: ->
    <Control component={ Link } presets={ @presets } />
