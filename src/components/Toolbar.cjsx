'use strict'

React = require('react')
css = require('reactcss')



class Toolbar extends React.Component
  css: css.inline

  @propTypes =
    align: React.PropTypes.oneOf(['left', 'right', 'justify'])

  @propExamples =
    align:
      type: 'oneOf'
      like: ['left', 'right', 'justify']

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


    <div is="toolbar" className="flexbox-fix">
      { for child, i in @props.children
          <div is="item" key={ i }>
            { child }
          </div> }
    </div>



module.exports = Toolbar
