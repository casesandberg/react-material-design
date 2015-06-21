'use strict'

React = require('react')
css = require('reactcss')



class Subheader extends React.Component
  css: css.inline

  @propTypes =
    selected: React.PropTypes.bool

  @defaultProps =
    color: 'rgba(0, 0, 0, .54)'

  classes: ->
    'default':
      subhead:
        fontSize: '14px'
        height: '16px'
        lineHeight: '16px'
        color: @props.color      

  styles: -> @css()

  render: ->
    <div is="subhead">{ @props.children }</div>


module.exports = Subheader
