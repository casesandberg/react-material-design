'use strict'

React = require('react')
css = require('reactcss')



class TextField extends React.Component
  css: css.inline

  @propTypes =
    type: React.PropTypes.oneOf(['single-line', 'floating-label'])
    hint: React.PropTypes.string
    value: React.PropTypes.string
    disabled: React.PropTypes.bool

  @propExamples =
    type:
      type: 'oneOf'
      like: ['single-line', 'floating-label']
    hint:
      type: 'string'
      like: [ 'Hint', 'Email', 'Location (optional)', 'Placeholder']
    value:
      type: 'string'
      like: [ 'Input Text']
    disabled:
      type: 'bool'
      like: [ false, true ]

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
      wrap:
        position: 'relative'

      input:
        background: 'none'
        width: '100%'
        border: 'none'
        height: '32px'
        boxShadow: ' 0 1px 0 0 #eee'
        # margin: '8px 0'
        outline: 'none'
        fontSize: '16px'
        transition: 'box-shadow 100ms linear'

      floatingLabel:
        fontSize: '16px'
        color: '#aaa'
        position: 'absolute'
        top: '7px'
        left: '1px'
        transition: 'all 50ms linear'

    'focused':
      input:
        boxShadow: ' 0 2px 0 0 #2196f3'

    'float-label':
      floatingLabel:
        fontSize: '12px'
        transform: 'translateY(-20px)'

    # 'disabled':
    #   input:
    #     boxShadow: 'none'
    #     borderBottom: 'dotted 1px #eee'

  styles: -> @css
    'focused': @state.focus
    'float-label': @state.focus or @state.value?.length > 0

  handleChange: (e) =>
    @setState( value: e.target.value )

    if @props.onChange?
      @props.onChange(e, @props.data)

  handleFocus: (e) =>
    if e.type is 'focus'
      @setState( focus: true )
    if e.type is 'blur'
      @setState( focus: false )

  render: ->
    <div is="wrap">
      <input is="input" type="text" value={ @state.value } placeholder={ @props.hint if @props.type isnt 'floating-label' } onChange={ @handleChange } onFocus={ @handleFocus } onBlur={ @handleFocus } disabled={ @props.disabled } />
      { if @props.type is 'floating-label'
          <div is="floatingLabel">{ @props.hint }</div> }
    </div>



module.exports = TextField
