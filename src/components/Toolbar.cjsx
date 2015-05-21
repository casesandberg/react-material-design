'use strict'

React = require('react')
css = require('react-css')
Control = require('react-ctrl')



class Toolbar extends React.Component
  css: css.inline

  @propTypes = Control.enhance
    align: Control.PropTypes.oneOf(['left', 'right', 'justify']).example(['left', 'right', 'justify'])

  @defaultProps =
    align: 'left'

  classes: ->
    'default':
      toolbar:
        background: 'none'

      item:
        background: 'none'

    'align-left':
      toolbar:
        display: 'flex'
        justifyContent: 'flex-start'

    'align-right':
      toolbar:
        display: 'flex'
        justifyContent: 'flex-end'

    'align-justify':
      toolbar:
        display: 'flex'
        justifyContent: 'space-between'

  styles: -> @css()

  render: ->


    <div is="toolbar">
      { for child, i in @props.children
          <div is="item" key={ i }>
            { child }
          </div> }
    </div>



module.exports = Toolbar
