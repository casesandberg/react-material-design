'use strict'

React = require('react')
css = require('reactcss')



icons =
  'arrow-right': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
</svg>'

  'clock': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22C6.47,22 2,17.5 2,12A10,10 0 0,1 12,2M12.5,7V12.25L17,14.92L16.25,16.15L11,13V7H12.5Z" />
</svg>'

  'dots-vertical': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M12,16A2,2 0 0,1 14,18A2,2 0 0,1 12,20A2,2 0 0,1 10,18A2,2 0 0,1 12,16M12,10A2,2 0 0,1 14,12A2,2 0 0,1 12,14A2,2 0 0,1 10,12A2,2 0 0,1 12,10M12,4A2,2 0 0,1 14,6A2,2 0 0,1 12,8A2,2 0 0,1 10,6A2,2 0 0,1 12,4Z" />
</svg>'

  'star-outline': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z" />
</svg>'

  'calendar-check': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M19,19H5V8H19M19,3H18V1H16V3H8V1H6V3H5C3.89,3 3,3.9 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5A2,2 0 0,0 19,3M16.53,11.06L15.47,10L10.59,14.88L8.47,12.76L7.41,13.82L10.59,17L16.53,11.06Z" />
</svg>'

  'checkmark-marked-deconstructed': '<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
  	 width="18px" height="18px" viewBox="-290 388 18 18" enable-background="new -290 388 18 18" xml:space="preserve">
  <path d="M-283,402l-5-5l1.4-1.4l3.6,3.6l7.6-7.6l1.4,1.4"/>
  </svg>'

  'menu': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z" />
</svg>'

  'microphone': '<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path d="M12,2A3,3 0 0,1 15,5V11A3,3 0 0,1 12,14A3,3 0 0,1 9,11V5A3,3 0 0,1 12,2M19,11C19,14.53 16.39,17.44 13,17.93V21H11V17.93C7.61,17.44 5,14.53 5,11H7A5,5 0 0,0 12,16A5,5 0 0,0 17,11H19Z" />
</svg>'


class Icon extends React.Component
  css: css.inline

  @propTypes =
    name: React.PropTypes.string

  @propExamples =
    name:
      type: 'string'
      like: ['null', 'arrow-right', 'clock']

  @defaultProps =
    fill: '#bbb'

  classes: ->
    'default':
      icon:
        position: 'relative'

      svg:
        fill: @props.fill
        transition: 'fill 200ms linear'

    'tap-area':
      icon:
        width: '24px'
        height: '24px'
        lineHeight: '24px'
        textAlign: 'center'
        padding: '12px'

    'cut-in-half':
      icon:
        width: '12px'

      svg:
        marginLeft: '-6px'

  styles: -> @css
    'tap-area': true
    'cut-in-half': @props.name is 'dots-vertical'

  render: ->
    <div is="icon">
      <div is="svg" dangerouslySetInnerHTML={ __html: if icons[@props.name]? then icons[@props.name] else 'n/a' } />
    </div>



module.exports = Icon
