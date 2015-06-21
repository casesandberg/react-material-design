'use strict'

React = require('react')
css = require('reactcss')

Tab = require('./Tab')


context =
  primaryColor: '#2196F3'
  accentColor: '#E91E63'
  theme: 'light'


class Tabs extends React.Component
  css: css.inline

  @propTypes =
    align: React.PropTypes.oneOf(['none', 'justify', 'left', 'center'])
    children: React.PropTypes.array
    background: React.PropTypes.string

  @propExamples =
    align:
      type: 'oneOf'
      like: ['none', 'justify', 'left', 'center']
    children:
      type: 'array'
      like: [['cool', 'tabs'], ['foo', 'bar', 'longer'], ['foo', 'bar', 'way longer', 'even', 'still']]
    background:
      type: 'string'
      like: ['transparent', '#4A90E2']
    color:
      type: 'string'
      like: ['#fff', '#FFEB3B']

  @defaultProps =
    selectedTab: 0
    background: 'transparent'
    color: '#fff'

  constructor: (props) ->
    super props
    @state =
      selectedTab: if @props.selectedTab < @props.children.length then @props.selectedTab else 0

  classes: ->
    'default':
      tabs:
        position: 'relative'
        background: @props.background

      tabWrap:
        display: 'flex'

      tab:
        justifyContent: 'flex-start'
        minWidth: '68px'
        maxWidth: '240px'

      Tab:
        color: @props.color

      indicator:
        height: '2px'
        position: 'absolute'
        bottom: '0'
        left: '0'
        background: @props.color
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

    'align-justify':
      tabWrap:
        justifyContent: 'space-between'

      tab:
        width: "#{ 100 / @props.children.length }%"

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
              <Tab is="Tab" tab={ i } selected={ @state.selectedTab is i } onClick={ @handleClick }>{ child }</Tab>
            </div> }
      </div>
      <div is="indicator" ref="indicator" />
    </div>



module.exports = Tabs
