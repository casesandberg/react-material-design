'use strict'

React = require('react')

{ Ink } = require('../components')
Control = require('react-harness')



module.exports = class InkSpec extends React.Component

  presets:
    'default':
      children: <div style={ width: '150px', height: '150px', border: '1px dashed #ccc', borderRadius: '4px' } />

    'Wide Child':
      children: <div style={ width: '450px', height: '150px', border: '1px dashed #ccc', borderRadius: '4px' } />

  render: ->
    <Control component={ Ink } presets={ @presets } />
