'use strict'

React = require('react')

Button = require('../components/Button')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      label: 'Spec Button'

  describe: ->
    it 'label: foo', -> @setState( label: 'foo' )

  render: ->
    <Button {...@state } />



module.exports = ButtonSpec
