'use strict'

React = require('react')

{ List, Tile, Icon } = require('../components')
Control = require('../../modules/react-ctrl/Control')



class ListSpec extends React.Component

  presets:
    'default':
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

  render: ->
    <Control component={ List } presets={ @presets } width={ 300 } />



module.exports = ListSpec
