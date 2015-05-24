'use strict'

React = require('react')

{ TextField } = require('../components')
Control = require('../../modules/react-control/src/components/Control')



class TextFieldSpec extends React.Component

  presets:
    'default':
      type: 'single-line'
      hint: 'Hint'

  render: ->
    <Control component={ TextField } presets={ @presets } width={ 200 } />



module.exports = TextFieldSpec
