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
        width: '100%'

      sidebar:
        minWidth: '56px'
        maxWidth: '56px'
        flexBasis: '56' # 72 minus 16

      content:
        background: 'none'
        alignSelf: 'center'

      secondary:
        flexBasis: '42'
        textAlign: 'center'

      sidebarIcon:
        marginTop: '-12px'
        marginLeft: '-12px'
        marginBottom: '-12px'

    'clickable':
      tile:
        cursor: 'pointer'

    'divider':
      tile:
        boxShadow: 'inset 0 -1px 0 rgba(0,0,0,.12)'

  styles: -> @css
    'clickable': @props.onClick?

  handleClick: (e) => @props.onClick(e) if @props.onClick?

  handleControlsClick: (e) => @props.onClick(e, @props.children) if @props.onClick?

  render: ->
    <div is="tile" onClick={ if @props.controls then @handleControlsClick else @handleClick }>

      { if Object.prototype.toString.call(@props.children) is '[object Array]'
          [ sidebar, content... ] = @props.children
          <div is="primary">
            <div is="sidebar" key={ "sidebar-#{ sidebar }" }>
              { if sidebar.type.name is 'Icon'
                  <div is="sidebarIcon">
                    { sidebar }
                  </div>
                else
                  sidebar }
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
