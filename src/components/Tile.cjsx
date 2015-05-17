'use strict'

React = require('react')
css = require('react-css')



class Tile extends React.Component
  css: css.inline

  classes: ->
    'default':
      tile:
        background: 'none'

  styles: -> @css()

  render: ->
    <div is="tile">tile</div>



module.exports = Tile
