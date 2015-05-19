'use strict'

React = require('react')
css = require('react-css')



class Tab extends React.Component
  css: css.inline

  classes: ->
    'default':
      tab:
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

    'selected':
      tab:
        opacity: '1'

  styles: -> @css()


  handleClick: => @props.onClick(@props.tab)

  render: ->
    <div is="tab" onClick={ @handleClick }>{ @props.children }</div>


module.exports = Tab
