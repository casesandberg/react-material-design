'use strict'

React = require('react')
css = require('react-css')
uuid = require('uuid')

{ Tile, List, Raised, Subheader } = require('../../../../src/components')
ControlTile = require('./ControlTile')
#
#
#
# _ = require('lodash')
#
build = require('../build')



module.exports = class Control extends React.Component
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
            <div style={ marginLeft: '16px', marginBottom: '16px' }>
              <Subheader code>{ key }</Subheader>
              { looop(value, key) }
            </div>
          </div>
        else
          data = {}
          data[parent] = if key.split(',').length > 1 then key.split(',') else if key is 'true' then true else if key is 'false' then false else key # hacky, fix this
          <ControlTile key={ key } onClick={ value } data={ data } active={ @state }>{ key }</ControlTile>

    <div is="shell">

      <div is="left">
        <List>
          { for lable, i in names
              active = if lable is /function (.+)\(/.exec(@props.component.toString())[1] then true else false
              <div key={ i } style={ color: if active then '#4A90E2' else '#666' }>
                <Tile controls={ true } onClick={ (e, child) => @context.updateComponent(child) }>{ lable }</Tile>
              </div> }
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
            <Tile>
              <Subheader>PRESETS</Subheader>
            </Tile>
            <div style={ paddingLeft: '15px' }>
              { for name, data of @props.presets
                  change = (data) => @setState(data)
                  <ControlTile key={ name } onClick={ change } data={ data } active={ @state }>{ name }</ControlTile> }
            </div>
          </div> }

        {### TODO:
         MAKE IT SO THINGS THAT ARENT REQUIRED HAVE A 'NONE' FIElD
         ADD INPUT TYPE TO THE RIGHT OF THE PROP NAME
         ADD SOME SORT OF REQUIRED IMBELISHMENT FOR PROPS THAT ARE
        ###}

        <Tile>
          <Subheader>PROPS</Subheader>
        </Tile>
        { looop(build.call(@, @props.component?.propTypes?.controlProps?())) }


        {###<List>
          { runThrough.call(@props.parent, @props.parent.describe())  }
        </List>###}

        { ###looop(build(@props.children.type.expectedProps)) ###}
      </div>

    </div>
