'use strict'

React = require('react')
css = require('react-css')



class Tabs extends React.Component
  css: css.inline

  classes: ->
    'default':
      tabs: {}

      tabWrap:
        display: 'flex'
        justifyContent: 'space-between'

      tab:
        width: "#{ 100 / @props.children.length }%"
        # minWidth: '136px' # 160 minus 12*2
        minWidth: '44px' # 160 minus 12*2
        maxWidth: '240px'
        paddingLeft: '12px'
        paddingRight: '12px'
        height: '48px'
        lineHeight: '48px'
        textAlign: 'center'
        fontSize: '14px'
        textTransform: 'uppercase'
        fontWeight: '500'
        whiteSpace: 'nowrap'

    'scrollable':
      tabs:
        overflowX: 'scroll'
      tabWrap:
        paddingLeft: '60px'
        justifyContent: 'flex-start'
        width: '400%'
      tab:
        width: 'auto'

    'align-left':
      tabWrap:
        paddingLeft: '60px'
        justifyContent: 'flex-start'

      tab:
        width: 'auto'

    'align-center':
      tabWrap:
        justifyContent: 'center'

      tab:
        width: 'auto'


  styles: -> @css
    'scrollable': @props.width / @props.children.length < 72

  render: ->
    <div is="tabs">
      <div is="tabWrap">
        { for child, i in @props.children
            <div is="tab" key={ i }>{ child }</div> }
      </div>
    </div>



module.exports = Tabs
