'use strict'

React = require('react')
css = require('react-css')



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

    'code':
      subhead:
        display: 'inline-block'
        background: '#E4E4E4'
        padding: '4px 6px'
        borderRadius: '4px'
        fontSize: '14'
        color: '#999'
        boxShadow: 'inset 0 0 0 1px rgba(0,0,0,.07)'

  styles: -> @css()

  render: ->
    <div is="subhead">{ @props.children }</div>


module.exports = Subheader
