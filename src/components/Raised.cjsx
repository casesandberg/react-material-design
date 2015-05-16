'use strict'

React = require('react')
css = require('react-css')


class Raised extends React.Component
  css: css.inline

  @defaultProps =
    radius: '2px'
    zDepth: '1'

  classes: ->
    'default':
      wrap:
        position: 'relative'

      content:
        position: 'relative'

      bg:
        Absolute: '0 0 0 0'
        boxShadow: "0 #{ @props.zDepth }px #{ @props.zDepth * 4 }px rgba(0,0,0,.24)"
        borderRadius: @props.radius
        background: @props.background

    'z-depth-0':
      bg:
        boxShadow: 'none'

    'z-depth-1':
      bg:
        boxShadow: '0 2px 10px rgba(0,0,0,.12), 0 2px 5px rgba(0,0,0,.16)'

    'z-depth-2':
      bg:
        boxShadow: '0 6px 20px rgba(0,0,0,.19), 0 8px 17px rgba(0,0,0,.2)'

    'z-depth-3':
      bg:
        boxShadow: '0 17px 50px rgba(0,0,0,.19), 0 12px 15px rgba(0,0,0,.24)'

    'z-depth-4':
      bg:
        boxShadow: '0 25px 55px rgba(0,0,0,.21), 0 16px 28px rgba(0,0,0,.22)'

    'z-depth-5':
      bg:
        boxShadow: '0 40px 77px rgba(0,0,0,.22), 0 27px 24px rgba(0,0,0,.2)'

    'circle':
      bg:
        borderRadius: '50%'

  styles: -> @css
    'z-depth-0': @props.zDepth is '0'
    'z-depth-1': @props.zDepth is '1'
    'z-depth-2': @props.zDepth is '2'
    'z-depth-3': @props.zDepth is '3'
    'z-depth-4': @props.zDepth is '4'
    'z-depth-5': @props.zDepth is '5'

  # componentWillReceiveProps: (nextProps) ->
  #   if Number(nextProps.zDepth) > 5
  #     console.log 'greater than 5'

  render: ->
    <div is="wrap">
      <div is="bg" />
      <div is="content">{ @props.children }</div>
    </div>



module.exports = Raised
