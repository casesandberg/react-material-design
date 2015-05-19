'use strict'

React = require('react')
css = require('react-css')


context =
  primaryColor: '#2196F3'
  accentColor: '#E91E63'
  theme: 'light'


class Tab extends React.Component
  css: css.inline

  @propTypes =
    selected: React.PropTypes.bool

  @defaultProps =
    selected: false

  classes: ->
    'default':
      tab:
        color: if context.theme is 'dark' then 'rgba(0,0,0,.87)' else if context.theme is 'light' then 'rgba(255,255,255,.87)'
        cursor: 'pointer'
        paddingLeft: '12px'
        paddingRight: '12px'
        height: '48px'
        lineHeight: '48px'
        textAlign: 'center'
        fontSize: '14px'
        textTransform: 'uppercase'
        fontWeight: '500'
        whiteSpace: 'nowrap'
        opacity: '.5'
        transition: 'opacity 100ms linear'

    'public':
      tab: {}


    'selected':
      tab:
        opacity: '1'
        # color: @props.style?.activeColor

  styles: -> @css()


  handleClick: => @props.onClick(@props.tab)

  render: ->
    <div is="tab" onClick={ @handleClick }>{ @props.children }</div>


module.exports = Tab
