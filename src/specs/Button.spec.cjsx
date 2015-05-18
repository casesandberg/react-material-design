'use strict'

React = require('react')
uuid = require('uuid')

Shell = require('../../docs/controls/Shell')
{ Button } = require('../components')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      label: 'Button'

      style:
        background: '#2196f3'
        color: '#fff'

  describe: =>
    'PROPS':
      'type':
        'raised (default)': => @setState( type: 'raised' )
        'flat': => @setState( type: 'flat' )
        'floating-action': => @setState( type: 'floating-action' )

    # 'label: foo': => @setState( label: 'foo' )
    #
    # 'theme: blue': => @setState( type: 'raised', background: '#2196f3', color: '#fff' )
    # 'theme: white flat': => @setState( type: 'flat', color: '#333' )

    'zDepth':
      '0': => @setState( zDepth: '0' )
      '1': => @setState( zDepth: '1' )
      '2': => @setState( zDepth: '2' )
      '3': => @setState( zDepth: '3' )
      '4': => @setState( zDepth: '4' )
      '5': => @setState( zDepth: '5' )
      # '6': => @setState( zDepth: '6' )

  render: ->
    <Shell this={ @ }>
      <Button {...@state } />
    </Shell>



module.exports = ButtonSpec
