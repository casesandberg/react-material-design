'use strict'

React = require('react')

Shell = require('../../docs/controls/Shell')
{ List, Tile, Icon } = require('../components')



class ListSpec extends React.Component

  constructor: (props) ->
    super props
    @state =
      children: [
        <Tile divider={ true }>
          <Icon name="clock" />
          <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </div>
        </Tile>
      ,
        <Tile divider={ true }>
          <Icon name="clock" />
          <div>Condimentum adipiscing sit.</div>
        </Tile>
      ,
        <Tile>
          <Icon name="clock" />
          <div>Mauris ultricies nisi sit amet fringilla placerat. Vestibulum condimentum auctor tellus.</div>
        </Tile>
      ]

  describe: ->
    'PRESET':
      'none': => console.log 'none' # @setState( children: [<Icon name="clock" />,<div>Content</div>], secondaryAction: <Icon name="arrow-right" />)

  render: ->
    <Shell this={ @ } width={ 300 }>
      <List {...@state } />
    </Shell>



module.exports = ListSpec
