'use strict'

React = require('react')
css = require('reactcss')

{ Raised, Tile } = require('react-material-design')



class GoogleMaps extends React.Component
  css: css.inline

  classes: ->
    'default':
      phone:
        width: '320px'
        height: '568px'

      headerSearch:
        absolute: '0 0 auto 0'

      AutoComplete:
        inset: true
        hint: 'Location'
        value: 'Bi-Rite Market'
        leftIcon: 'menu'
        rightIcon: 'microphone'

      Raised: {}

  styles: -> @css()

  render: ->
    <div is="phone">

      <div is="headerSearch">
        <div is="AutoComplete">
          <Raised is="Raised">
            <Tile>
              Icon
              raised
            </Tile>
          </Raised>
        </div>
      </div>

    </div>



module.exports = GoogleMaps
