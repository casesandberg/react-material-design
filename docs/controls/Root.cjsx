'use strict'

React = require('react')


specs = require('../../src/specs')


class Root extends React.Component

  constructor: (props) ->
    super props
    @state =
      active: 'ButtonSpec'

  render: ->
    <div style={ fontFamily: 'Roboto', display: 'flex', justifyContent: 'space-between', alignItems: 'stretch', position: 'absolute', top: '0', left: '0', bottom: '0', right: '0' }>
      <div style={ flexBasis: '200', background: '#eee' }>
        { for name, specComponent of specs
            <div key={ name }>{ name }</div> }
      </div>

      { React.createElement( specs[ @state.active ] ) }

    </div>



module.exports = Root
