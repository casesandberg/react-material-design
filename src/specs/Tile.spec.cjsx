'use strict'

React = require('react')

Tile = require('../components/Tile')
Shell = require('../../docs/controls/Shell')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      foo: 'bar'

  describe: ->
    'nothing': -> console.log('nothing')

  render: ->
    <Shell this={ @ } width={ 200 }>
      <Tile {...@state } />
    </Shell>



module.exports = ButtonSpec
