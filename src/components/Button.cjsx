'use strict'

React = require('react')



class Button extends React.Component

  @defaultProps =
    label: 'Foo Bar'

  render: ->
    <div>{ @props.label }</div>



module.exports = Button
