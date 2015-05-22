'use strict'

React = require('react')
css = require('react-css')
uuid = require('uuid')

{ Tile, List, Raised } = require('../../src/components')
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
        background: '#f6f6f6'

      left:
        minWidth: '150px'
        flexBasis: '150'
        overflowY: 'scroll'

      center:
        width: '100%'
        padding: '2% 0'
        height: '94%'

      centerFlex:
        display: 'flex'
        justifyContent: 'center'
        width: '100%'
        height: '100%'

      centerWrap:
        alignSelf: 'center'
        width: @state.width || @props.width

      right:
        minWidth: '250px'
        flexBasis: '250'
        overflowY: 'scroll'

  styles: -> do @css


  componentWillMount: ->
    states = _.merge({}, @props.component.defaultProps, @props.presets['default'])
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
            <Tile key={ key } color="#999">{ key }</Tile>
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
            <Tile key={ key } code>{ key }</Tile>
            { looop(value, key) }
          </div>
        else
          data = {}
          data[parent] = if key.split(',').length > 1 then key.split(',') else if key is 'true' then true else if key is 'false' then false else key # hacky, fix this
          <ControlsTile key={ key } onClick={ value } data={ data } active={ @state }>{ key }</ControlsTile>

    <div is="shell">

      <div is="left">
        <List>
          { for lable, i in names
              <Tile key={ i } controls={ true } onClick={ (e, child) => @context.updateComponent(child) }>{ lable }</Tile> }
        </List>
      </div>


      <div is="center">
        <Raised background="#fff" full>
          <div is="centerFlex">
            <div is="centerWrap">

              { if @props.wrapper
                  React.createElement(@props.wrapper[0], @props.wrapper[1], React.createElement(@props.component, @state))
                else
                  React.createElement(@props.component, @state) }

            </div>
          </div>
        </Raised>
      </div>


      <div is="right">

        { presets = 0; presets++ for key of @props.presets;
        if presets > 1
          <div>
            <Tile color="#999">PRESETS</Tile>
            <div style={ paddingLeft: '15px' }>
              { for name, data of @props.presets
                  change = (data) => @setState(data)
                  <ControlsTile key={ name } onClick={ change } data={ data } active={ @state }>{ name }</ControlsTile> }
            </div>
          </div> }

        <Tile color="#999">API</Tile>
        { if @props.component.propTypes?.controlProps?()?
            <div style={ paddingLeft: '15px' }>{ looop(build.call(@, @props.component.propTypes.controlProps())) }</div>
          else
           <div style={ paddingLeft: '15px' }>{ looop(build.call(@, @props.component.expectedProps)) }</div> }


        {###<List>
          { runThrough.call(@props.parent, @props.parent.describe())  }
        </List>###}

        { ###looop(build(@props.children.type.expectedProps)) ###}
      </div>

    </div>



module.exports = Control
