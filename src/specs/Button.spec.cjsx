'use strict'

React = require('react')
uuid = require('uuid')

Button = require('../components/Button')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      label: 'Spec Button'
      background: '#2196f3'

  # statics: {}
  describe: ->
    'type':
      'raised (default)': => @setState( type: 'raised' )
      'flat': => @setState( type: 'flat' )
      'floating-action': => @setState( type: 'floating-action' )

    'label: foo': => @setState( label: 'foo' )

    'theme: blue': => @setState( type: 'raised', background: '#2196f3', color: '#fff' )
    'theme: white flat': => @setState( type: 'flat', color: '#333' )

    'zDepth':
      '0': => @setState( zDepth: '0' )
      '1': => @setState( zDepth: '1' )
      '2': => @setState( zDepth: '2' )
      '3': => @setState( zDepth: '3' )
      '4': => @setState( zDepth: '4' )
      '5': => @setState( zDepth: '5' )
      # '6': => @setState( zDepth: '6' )

  render: ->
    runThrough = (obj) ->
      for key, value of obj
        if typeof value is 'function'
          <div onClick={ value } key={ key }>{ key }</div>
        else
          <div key={ uuid.v4() }>
            <div key={ key }>{ key }</div>
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
