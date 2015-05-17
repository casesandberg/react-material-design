'use strict'

React = require('react')
css = require('react-css')



class Tile extends React.Component
  css: css.inline

  classes: ->
    'default':
      tile:
        fontSize: '16px'
        padding: '16px'

    'clickable':
      tile:
        cursor: 'pointer'

  styles: -> @css
    'clickable': @props.onClick?

  handleClick: (e) => @props.onClick(e)

  render: ->
    <div is="tile" onClick={ @handleClick }>
      <div is="primary">
        { if Object.prototype.toString.call(@props.children) is '[object Array]'
            [ sidebar, content... ] = @props.children
            <div is="sidebar" key={ "sidebar-#{ sidebar }" }>
              { sidebar }
            </div>
            <div is="content" key={ "content-#{ content }" }>
              { for child, i in content
                <div key={ i }>
                  { child }
                </div> }
            </div>
          else
            <div is="content">{ @props.children }</div> }
      </div>
    </div>



module.exports = Tile
