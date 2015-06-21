'use strict'

React = require('react')
css = require('reactcss')



class List extends React.Component
  css: css.inline

  @propTypes =
    children: React.PropTypes.node

  classes: ->
    'default':
      list:
        padding: '8px 0'

  styles: -> @css()

  render: ->
    <div is="list">
      { if @props.children
          for child, i in @props.children
            <div is="row" key={ i }>
              { child }
            </div> }
    </div>



module.exports = List
