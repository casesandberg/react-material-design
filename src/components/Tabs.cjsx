'use strict'

React = require('react')
css = require('react-css')



class Tabs extends React.Component
  css: css.inline

  @defaultProps =
    selectedTab: 0

  classes: ->
    'default':
      tabs:
        position: 'relative'

      tabWrap:
        display: 'flex'
        justifyContent: 'space-between'

      tab:
        width: "#{ 100 / @props.children.length }%"
        minWidth: '68px'
        maxWidth: '240px'

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
    selected = @refs["tab-#{ @props.selectedTab }"].getDOMNode()
    @moveIndicator(selected.getBoundingClientRect().left - @refs.tabs.getDOMNode().getBoundingClientRect().left, selected.offsetWidth)

  componentDidUpdate: ->
    selected = @refs["tab-#{ @props.selectedTab }"].getDOMNode()
    @moveIndicator(selected.getBoundingClientRect().left - @refs.tabs.getDOMNode().getBoundingClientRect().left, selected.offsetWidth)

  render: ->
    <div is="tabs" ref="tabs">
      <div is="tabWrap">
        { for child, i in @props.children
            <div is="tab" ref={ "tab-#{ i }" } key={ i }>
              <Tab tab={ i } selected={ @props.selectedTab is i } onClick={ @handleClick }>{ child }</Tab>
            </div> }
      </div>
      <div is="indicator" ref="indicator" />
    </div>



class Tab extends React.Component
  css: css.inline

  classes: ->
    'default':
      tab:
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



module.exports = Tabs
