'use strict'

React = require('react')
css = require('react-css')



class Tile extends React.Component
  css: css.inline

  classes: ->
    'default':
      tile:
        fontSize: '16px'
        padding: '16px 0 16px 16px'
        display: 'flex'
        justifyContent: 'space-between'

      primary:
        display: 'flex'

      sidebar:
        flexBasis: '56' # 72 minus 16

      content:
        background: 'none'

      secondary:
        flexBasis: '42'
        textAlign: 'center'

    'clickable':
      tile:
        cursor: 'pointer'

  styles: -> @css
    'clickable': @props.onClick?

  handleClick: (e) => @props.onClick(e) if @props.onClick?

  render: ->
    <div is="tile" onClick={ @handleClick }>

      { if Object.prototype.toString.call(@props.children) is '[object Array]'
          [ sidebar, content... ] = @props.children
          <div is="primary">
            <div is="sidebar" key={ "sidebar-#{ sidebar }" }>
              { sidebar }
            </div>
            <div is="content" key={ "content-#{ content }" }>
              { for child, i in content
                <div key={ i }>
                  { child }
                </div> }
            </div>
          </div>
        else
          <div is="primary">
            <div is="content">{ @props.children }</div>
          </div> }

      { if @props.secondaryAction
        <div is="secondary">
          { @props.secondaryAction }
        </div>
      }



    </div>



module.exports = Tile
