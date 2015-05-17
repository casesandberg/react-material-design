'use strict'

React = require('react')
css = require('react-css')



class List extends React.Component
  css: css.inline

  classes: ->
    'default':
      list:
        padding: '8px 0'

  styles: -> @css()

  render: ->
    <div is="list">
      { for child, i in @props.children
        <div is="row" key={ i }>
          { child }
        </div> }
    </div>



module.exports = List
