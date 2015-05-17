'use strict'

React = require('react')
css = require('react-css')


icons =
  'arrow-right': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
</svg>'

  'clock': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22C6.47,22 2,17.5 2,12A10,10 0 0,1 12,2M12.5,7V12.25L17,14.92L16.25,16.15L11,13V7H12.5Z" />
</svg>'


class Icon extends React.Component
  css: css.inline

  @defaultProps =
    type: 'raised'
    zDepth: '1'

  classes: ->
    'default':
      icon:
        background: 'none'

      svg:
        background: 'none'

  styles: -> @css()

  render: ->
    <div is="icon">
      <div is="svg" dangerouslySetInnerHTML={ __html: if icons[@props.name]? then icons[@props.name] else 'n/a' } />
    </div>



module.exports = Icon
