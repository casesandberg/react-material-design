'use strict'

React = require('react')

Button = require('../components/Button')



class ButtonSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      label: 'Spec Button'

  describe: ->
    'label: foo': => @setState( label: 'foo' )

  render: ->
    <div style={ display: 'flex', justifyContent: 'space-between', position: 'absolute', top: '0', left: '220px', bottom: '0', right: '0' }>
      <div style={ alignSelf: 'center' }>
        <Button {...@state } />
      </div>
      <div style={ flexBasis: '200', background: '#ddd' }>
        { for label, func of @describe()
            <div onClick={ func }>{ label }</div> }
      </div>
    </div>



module.exports = ButtonSpec
