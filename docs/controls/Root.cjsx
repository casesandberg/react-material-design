'use strict'

React = require('react')
css = require('react-css')



class Root extends React.Component
  css: css.inline

  @childContextTypes:
    components: React.PropTypes.object
    updateComponent: React.PropTypes.func

  handleComponentUpdate: (name) ->
    @setState( active: name )

  getChildContext: ->
    updateComponent: (name) =>
      localStorage.setItem( 'SelectedComponent', name )
      @handleComponentUpdate(name)
    components: @props.components

  classes: ->
    'default':
      wrap:
        background: 'none'

  styles: -> do @css

  constructor: (props) ->
    super props
    @state =
      active: localStorage.getItem( 'SelectedComponent' ) || 'Toolbar'

  render: ->
    React.createElement( @props.components[ @state.active ] )


module.exports = Root
