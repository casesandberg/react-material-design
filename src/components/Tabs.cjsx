'use strict'

React = require('react')
css = require('react-css')

Tab = require('./Tab')



class Tabs extends React.Component
  css: css.inline

  @defaultProps =
    selectedTab: 0

  constructor: (props) ->
    super props
    @state =
      selectedTab: if @props.selectedTab < @props.children.length then @props.selectedTab else 0

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
        bottom: '0'
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

  handleClick: (tab) => @setState( selectedTab: tab )

  moveIndicator: ->
    selected = @refs["tab-#{ @state.selectedTab }"]?.getDOMNode()

    if selected
      @refs.indicator.getDOMNode().style.left = selected.getBoundingClientRect().left - @refs.tabs.getDOMNode().getBoundingClientRect().left + @refs.tabs.getDOMNode().scrollLeft
      @refs.indicator.getDOMNode().style.width = selected.offsetWidth

  componentDidMount: -> @moveIndicator()

  componentWillUpdate: (nextProps, nextState) ->
    if nextState.selectedTab >= nextProps.children.length
      nextState.selectedTab = nextProps.children.length - 1

  componentDidUpdate: -> @moveIndicator()

  render: ->
    <div is="tabs" ref="tabs">
      <div is="tabWrap">
        { for child, i in @props.children
            <div is="tab" ref={ "tab-#{ i }" } key={ i }>
              <Tab tab={ i } selected={ @state.selectedTab is i } onClick={ @handleClick }>{ child }</Tab>
            </div> }
      </div>
      <div is="indicator" ref="indicator" />
    </div>



module.exports = Tabs
