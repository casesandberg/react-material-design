'use strict'

React = require('react')
css = require('react-css')
Control = require('react-control')



class TextField extends React.Component
  css: css.inline

  @propTypes = Control.enhance
    type: Control.PropTypes.oneOf(['single-line']).example(['single-line'])
    hint: Control.PropTypes.string.example([ 'Hint', 'Email', 'Location (optional)', 'Placeholder'])
    value: Control.PropTypes.string.example([ 'Input Text'])
    disabled: Control.PropTypes.bool.example([ false, true ])

  @defaultProps =
    type: 'single-line'
    disabled: false

  constructor: (props) ->
    super props
    @state =
      value: @props.value
      focused: false

  classes: ->
    'default':
      wrap: {}

      input:
        background: 'none'
        width: '100%'
        border: 'none'
        height: '32px'
        boxShadow: ' 0 1px 0 0 #eee'
        margin: '8px 0'
        outline: 'none'
        fontSize: '15px'
        transition: 'box-shadow 100ms linear'

    'focused':
      input:
        boxShadow: ' 0 3px 0 0 #2196f3'
    
    # 'disabled':
    #   input:
    #     boxShadow: 'none'
    #     borderBottom: 'dotted 1px #eee'

  styles: -> @css
    'focused': @state.focus

  handleChange: (e) =>
    if @props.onChange?
      @setState( value: e.target.value )
      @props.onChange(e, @props.data)

  handleFocus: (e) =>
    if e.type is 'focus'
      @setState( focus: true )
    if e.type is 'blur'
      @setState( focus: false )

  render: ->
    <div is="wrap">
      <input is="input" type="text" value={ @state.value } placeholder={ @props.hint } onChange={ @handleChange } onFocus={ @handleFocus } onBlur={ @handleFocus } disabled={ @props.disabled } />
    </div>



module.exports = TextField
