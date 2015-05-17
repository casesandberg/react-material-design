'use strict'

React = require('react')
uuid = require('uuid')

Shell = require('../../docs/controls/Shell')
{ Icon } = require('../components')



class IconSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      name: 'arrow-right'

  describe: =>
    'API':
      'name':
        'null': => @setState( name: '' )
        'arrow-right': => @setState( name: 'arrow-right' )
        'clock': => @setState( name: 'clock' )

  render: ->
    <Shell this={ @ }>
      <Icon {...@state } />
    </Shell>



module.exports = IconSpec
