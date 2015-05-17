'use strict'

React = require('react')
css = require('react-css')
uuid = require('uuid')



class Shell extends React.Component
  css: css.inline

  @contextTypes:
    components: React.PropTypes.object
    updateComponent: React.PropTypes.func

  @defaultProps =
    width: 'auto'

  classes: ->
    'default':
      shell:
        Absolute: '0 0 0 0'
        fontFamily: 'Roboto'
        display: 'flex'
        justifyContent: 'space-between'
        alignItems: 'stretch'

      left:
        flexBasis: '200'
        background: '#eee'

      center:
        alignSelf: 'center'
        width: @props.width

      right:
        flexBasis: '200'
        background: '#ddd'

      sidebarItem:
        padding: '10px'
        cursor: 'pointer'

  styles: -> do @css

  render: ->
    runThrough = (obj) ->
      for key, value of obj
        if typeof value is 'function'
          <div onClick={ value } key={ key }>{ key }</div>
        else
          <div key={ uuid.v4() }>
            <div key={ key }>{ key }</div>
            <div style={ paddingLeft: '15px' }>{ runThrough.call(@, value) }</div>
          </div>

    <div is="shell">

      <div is="left">
        { for name, specComponent of @context.components
            <div is="sidebarItem" key={ name } onClick={ (e) => @context.updateComponent(e.target.innerHTML) }>{ name }</div> }
      </div>

      <div is="center">
        { @props.children }
      </div>

      <div is="right">
        { runThrough.call(@props.this, @props.this.describe())  }
      </div>

    </div>



module.exports = Shell
