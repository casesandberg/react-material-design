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

  slide: ->    
    containerNode = @refs.tabs.getDOMNode()
    containerLeft = containerNode.scrollLeft
    containerRight = containerNode.offsetWidth + containerNode.scrollLeft

    selectedNode = @refs["tab-#{ @state.selectedTab }"]?.getDOMNode()
    selectedLeft = selectedNode.getBoundingClientRect().left - containerNode.getBoundingClientRect().left + containerNode.scrollLeft
    selectedRight = selectedLeft + selectedNode.offsetWidth

    # scroll right if tab is off screen
    if selectedRight > containerRight
      containerNode.scrollLeft += (selectedRight - containerRight)
    # scroll left if tab is off screen
    if selectedLeft < containerLeft
      containerNode.scrollLeft -= (containerLeft - selectedLeft)
    # slide the indicator
    @refs.indicator.getDOMNode().style.left = selectedLeft
    @refs.indicator.getDOMNode().style.width = selectedNode.offsetWidth

  componentDidMount: -> @slide()

  componentWillUpdate: (nextProps, nextState) ->
    if nextState.selectedTab >= nextProps.children.length
      nextState.selectedTab = nextProps.children.length - 1

  componentDidUpdate: -> @slide()

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
