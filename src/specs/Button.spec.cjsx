'use strict'

React = require('react')

Button = require('../components/Button')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      label: 'Spec Button'
      background: '#2196f3'

  describe: ->
    'type':
      'raised (default)': => @setState( type: 'raised' )
      'flat': => @setState( type: 'flat' )
      'floating-action': => @setState( type: 'floating-action' )

    'label: foo': => @setState( label: 'foo' )

    'theme: blue': => @setState( type: 'raised', background: '#2196f3', color: '#fff' )
    'theme: white flat': => @setState( type: 'flat', color: '#333' )

  render: ->
    runThrough = (obj) ->
      for key, value of obj
        if typeof value is 'function'
          <div onClick={ value }>{ key }</div>
        else
          <div>
            <div>{ key }</div>
            <div style={ paddingLeft: '15px' }>{ runThrough(value) }</div>
          </div>

    <div style={ display: 'flex', justifyContent: 'space-between', position: 'absolute', top: '0', left: '220px', bottom: '0', right: '0' }>
      <div style={ alignSelf: 'center' }>
        <Button {...@state } />
      </div>
      <div style={ flexBasis: '200', background: '#ddd' }>
        { runThrough @describe() }
      </div>
    </div>



module.exports = ButtonSpec
