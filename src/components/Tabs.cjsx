'use strict'

React = require('react')
css = require('react-css')



class Tabs extends React.Component
  css: css.inline

  @defaultProps =
    selectedIndex: 0

  classes: ->
    'default':
      tabs:
        position: 'relative'

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

      indicator:
        height: '2px'
        position: 'absolute'
        left: '0'
        background: '#333'
        transition: 'all 200ms linear'

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

  handleClick: (tab) => @props.onSelect( tab )

  moveIndicator: (left, width) ->
    @refs.indicator.getDOMNode().style.left = left
    @refs.indicator.getDOMNode().style.width = width

  componentDidMount: ->
    selected = @refs["tab-#{ @props.selectedIndex }"].getDOMNode()
    @moveIndicator(selected.getBoundingClientRect().left - @refs.tabs.getDOMNode().getBoundingClientRect().left, selected.offsetWidth)

  componentDidUpdate: ->
    selected = @refs["tab-#{ @props.selectedIndex }"].getDOMNode()
    @moveIndicator(selected.getBoundingClientRect().left - @refs.tabs.getDOMNode().getBoundingClientRect().left, selected.offsetWidth)

  render: ->
    <div is="tabs" ref="tabs">
      <div is="tabWrap">
        { for child, i in @props.children
            <div is="tab" ref={ "tab-#{ i }" } key={ i }><Tab tab={ i } onClick={ @handleClick }>{ child }</Tab></div> }
      </div>
      <div is="indicator" ref="indicator" />
    </div>



class Tab extends React.Component

  handleClick: => @props.onClick(@props.tab)

  render: ->
    <div onClick={ @handleClick }>{ @props.children }</div>



module.exports = Tabs
