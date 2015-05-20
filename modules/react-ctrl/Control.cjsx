'use strict'

React = require('react')
css = require('react-css')
uuid = require('uuid')

Tile = require('../../src/components/Tile')
List = require('../../src/components/List')
ControlsTile = require('../../docs/controls/ControlsTile')

_ = require('lodash')

build = require('./build')



class Control extends React.Component
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


  componentWillMount: ->
    states = _.merge(@props.component.defaultProps, @props.presets['default'])
    for key, value of states
      data = {}
      data[key] = value
      @setState(data)


  render: ->

    names = []
    for name, specComponent of @context.components
      names.push(name)

    runThrough = (obj) =>
      for key, value of obj
        if key is 'API'
          <div key={ uuid.v4() }>
            <Tile key={ key }>{ key }</Tile>
            <div style={ paddingLeft: '15px' }>{ looop(value()) }</div>
          </div>
        else
          if typeof value is 'function'
            <Tile onClick={ value } key={ key }>{ key }</Tile>
          else
            <div key={ uuid.v4() }>
              <Tile key={ key }>{ key }</Tile>
              <div style={ paddingLeft: '15px' }>{ runThrough.call(@, value) }</div>
            </div>


    looop = (obj, parent) =>
      for key, value of obj

        if _.isObject(value) and not _.isFunction(value)
          <div key={ uuid.v4() }>
            <Tile key={ key }>{ key }</Tile>
            <div style={ paddingLeft: '15px' }>{ looop(value, key) }</div>
          </div>
        else
          data = {}
          data[parent] = key
          <ControlsTile key={ key } onClick={ value } data={ data } active={ @state }>{ key }</ControlsTile>

    <div is="shell">

      <div is="left">
        <List>
          { for lable, i in names
              <Tile key={ i } controls={ true } onClick={ (e, child) => @context.updateComponent(child) }>{ lable }</Tile> }
        </List>
      </div>

      <div is="center">
        { React.createElement(@props.component, @state)}
      </div>

      <div is="right">

        { presets = 0; presets++ for key of @props.presets;
        if presets > 1
          <div>
            <Tile>PRESETS</Tile>
            <div style={ paddingLeft: '15px' }>
              { for name, data of @props.presets
                  change = (data) => @setState(data)
                  <ControlsTile key={ name } onClick={ change } data={ data } active={ @state }>{ name }</ControlsTile> }
            </div>
          </div> }

        <Tile>API</Tile>
        <div style={ paddingLeft: '15px' }>{ looop(build.call(@, @props.component.expectedProps)) }</div>

        {###<List>
          { runThrough.call(@props.parent, @props.parent.describe())  }
        </List>###}

        { ###looop(build(@props.children.type.expectedProps)) ###}
      </div>

    </div>



module.exports = Control
