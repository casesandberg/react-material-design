'use strict'

React = require('react')
css = require('react-css')
uuid = require('uuid')

Tile = require('../../src/components/Tile')
List = require('../../src/components/List')



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

  styles: -> do @css

  render: ->
    runThrough = (obj) ->
      for key, value of obj
        if typeof value is 'function'
          <Tile onClick={ value } key={ key }>{ key }</Tile>
        else
          <div key={ uuid.v4() }>
            <Tile key={ key }>{ key }</Tile>
            <div style={ paddingLeft: '15px' }>{ runThrough.call(@, value) }</div>
          </div>

    <div is="shell">

      <div is="left">
        <List>
          { for name, specComponent of @context.components
              <Tile key={ name } onClick={ (e) => @context.updateComponent(e.target.innerHTML) }>{ name }</Tile> }
        </List>
      </div>

      <div is="center">
        { @props.children }
      </div>

      <div is="right">
        <List>
          { runThrough.call(@props.this, @props.this.describe())  }
        </List>
      </div>

    </div>



module.exports = Shell
