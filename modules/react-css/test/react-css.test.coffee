css = require('../lib/react-css')
expect = require('chai').expect



describe 'css', ->
  it 'should marge and expand css', ->
    before = [
      page:
        position: 'relative'
        background: '#fafafa'

      header:
        font: '24px Roboto 600 rgba(0,0,0,.87)'
    ,
      page:
        background: '#333'

      header:
        color: 'rgba(255,255,255,.87)'

      card:
        borderRadius: '2'
    ]

    after =
      page:
        position: 'relative'
        background: '#333'

      header:
        font: '24px Roboto 600 rgba(0,0,0,.87)'
        color: 'rgba(255,255,255,.87)'

      card:
        msBorderRadius: '2'
        MozBorderRadius: '2'
        OBorderRadius: '2'
        WebkitBorderRadius: '2'
        borderRadius: '2'

    expect(css(before)).to.eql(after)



  it 'should be able to handle conditional styles', ->

    before = [
      page:
        position: 'relative'
        background: '#fafafa'

      header:
        font: '24px Roboto 600 rgba(0,0,0,.87)'
    , if 2 is 3
      page:
        background: '#333'

      header:
        color: 'rgba(255,255,255,.87)'

      card:
        BorderRadius: '2'
    ,
      element:
        padding: '10px'
    ]

    after =
      page:
        position: 'relative'
        background: '#fafafa'

      header:
        font: '24px Roboto 600 rgba(0,0,0,.87)'

      element:
        padding: '10px'

    expect(css(before)).to.eql(after)



describe 'Resolve', ->

  it 'should resolve a basic list of arguments', ->
    before =
      margin: css.resolve '14px',
                          '20px' if true
     after =
       margin: '20px'

    expect(before).to.eql(after)



  it 'should resolve a long list of arguments', ->
    before =
      margin: css.resolve '14px',
                          '20px' if true,
                          '70px' if 2 is 2,
                          '20px' if true,
                          '70px' if 2 is 2,
                          '1px' if true,
                          '70px' if false
     after =
       margin: '1px'

    expect(before).to.eql(after)



  it 'should resolve return the default value if everything else is false', ->
    before =
      margin: css.resolve '14px',
                          '20px' if false
     after =
       margin: '14px'

    expect(before).to.eql(after)



describe 'Merge', ->

  it 'should return the same object if it is passed one', ->
    before =
      foo: 'bar'
      baz: 'fin'

     after =
       foo: 'bar'
       baz: 'fin'

    expect(css.merge(before)).to.eql(after)



  it 'should merge objects passed through array', ->

    base =
      card:
        background: '#fff'
        margin: '0 6px'

    hover =
      card:
        margin: '0'
        boxShadow: '0 1px 4px rgba(0,0,0,.24)'

    before = [base, hover]

    after =
      card:
        background: '#fff'
        margin: '0'
        boxShadow: '0 1px 4px rgba(0,0,0,.24)'

    expect(css.merge(before)).to.eql(after)



describe 'Replace', ->

  # Double check that it doesnt touch anything unless it matches
  it 'should return the same object if nothing matches', ->
    before =
      card:
        position: 'absolute'

    after =
      card:
        position: 'absolute'

    expect(css.replace(before)).to.eql(after)



  # In the case of a style being passed down to a child component
  it 'should skip selectors whos values are strings or arrays', ->
    before =
      button: 'bigger'

    after =
      button: 'bigger'

    beforeArray =
      button: ['bigger']

    afterArray =
      button: ['bigger']

    expect(css.replace(before)).to.eql(after)
    expect(css.replace(beforeArray)).to.eql(afterArray)



  it 'should expand basic custom props where the output is just values', ->

    before =
      card:
        borderRadius: '2'

    after =
      card:
        msBorderRadius: '2'
        MozBorderRadius: '2'
        OBorderRadius: '2'
        WebkitBorderRadius: '2'
        borderRadius: '2'

    expect(css.replace(before)).to.eql(after)



  it 'should expand custom props where the output is a complex eval', ->

    before =
      card:
        Absolute: '0 0 0 0'

    after =
      card:
        position: 'absolute'
        top: '0'
        right: '0'
        bottom: '0'
        left: '0'

    expect(css.replace(before)).to.eql(after)


  # this was a fix for checking that it didnt replace other stuff. Write a better
  # test for the future
  it 'should expand custom props where the output is a complex eval v2', ->

    before =
      card:
        Absolute: '0 0 0 0'
        background: '#fff'

    after =
      card:
        position: 'absolute'
        top: '0'
        right: '0'
        bottom: '0'
        left: '0'
        background: '#fff'

    expect(css.replace(before)).to.eql(after)



  it 'should be able to step through and epand a compex array properly', ->
    before =
      body:
        sidebar:
          card:
            Absolute: '0 0 0 0'

    after =
      body:
        sidebar:
          card:
            position: 'absolute'
            top: '0'
            right: '0'
            bottom: '0'
            left: '0'

    expect(css.replace(before)).to.eql(after)



  it 'should be able to pass through functions to transform', ->

    customFunc =
      AddTogetherMargin: (value) ->

        total = 0

        for number in value.split(' ')
          total += parseInt(number)

        return { margin: total }

    before =
      body:
        AddTogetherMargin: '2 2'

    after =
      body:
        margin: 4

    expect(css.replace(before, customFunc)).to.eql(after)



describe 'React Inline', ->

  # it 'should warn you if there are no classes', ->
  #
  #   before = undefined
  #
  #   after = {}
  #
  #   expect(css.inline.call(@, before)).to.throw()


  it 'should return a css object from a set of true class names', ->

    @classes = ->
      'base':
        card:
          position: 'absolute'

    before =
      foo: false
      'base': true

    after =
      card:
        position: 'absolute'

    expect(css.inline.call(@, before)).to.eql(after)



  it 'should return a css object from a bunch of class names', ->

    @classes = ->
      'base':
        card:
          position: 'absolute'

      'outlined':
        card:
          border: '2px solid #aeee00'

      'disabled':
        card:
          display: 'none'

    before =
      'base': true
      'outlined': true
      'disabled': false

    after =
      card:
        position: 'absolute'
        border: '2px solid #aeee00'

    expect(css.inline.call(@, before)).to.eql(after)


  it 'should include the `default` class', ->

    @classes = ->
      'default':
        card:
          position: 'absolute'

    after =
      card:
        position: 'absolute'

    expect(css.inline.call(@)).to.eql(after)


  it 'should include the `public` class at the end', ->

    @classes = ->
      'public':
        card:
          opacity: '0'

      'visible':
        card:
          opacity: '1'

    before =
      'visible': true

    after =
      card:
        opacity: '0'

    expect(css.inline.call(@, before)).to.eql(after)


  it 'should grab props.style and include it', ->
    @props =
      style:
        class: 'outlined'

    @classes = ->
      'base':
        card:
          position: 'absolute'

      'outlined':
        card:
          border: '2px solid #aeee00'

    before =
      'base': true

    after =
      card:
        position: 'absolute'
        border: '2px solid #aeee00'

    expect(css.inline.call(@, before)).to.eql(after)


  it 'should grab any additional props.style css and include it', ->
    @props =
      style:
        class: 'outlined'

        card:
          display: 'none'

    @classes = ->
      'base':
        card:
          position: 'absolute'

      'outlined':
        card:
          border: '2px solid #aeee00'

    before =
      'base': true

    after =
      card:
        position: 'absolute'
        border: '2px solid #aeee00'
        display: 'none'

    expect(css.inline.call(@, before)).to.eql(after)



  it 'should seperate class names and call them in order', ->
    @props =
      style:
        class: 'outlined dark-text'

    @classes = ->
      'base':
        card:
          position: 'absolute'

      'dark-text':
        card:
          color: '#333'

      'outlined':
        card:
          color: '#aeee00'
          border: '2px solid #aeee00'

    before =
      'base': true

    after =
      card:
        position: 'absolute'
        color: '#333'
        border: '2px solid #aeee00'

    expect(css.inline.call(@, before)).to.eql(after)



  it 'should check if props match any class names and include them if they do', ->
    @props =
      isSelected: true

    @classes = ->
      'default':
        card:
          position: 'absolute'

      'isSelected':
        card:
          color: '#aeee00'
          border: '2px solid #aeee00'

    after =
      card:
        position: 'absolute'
        color: '#aeee00'
        border: '2px solid #aeee00'

    expect(css.inline.call(@, before)).to.eql(after)


  it 'should check if props and values match a class', ->
    @props =
      isSelected: false
      zDepth: 2

    @classes = ->
      'default':
        card:
          position: 'absolute'

      'isSelected-false':
        card:
          background: 'grey'

      'zDepth-2':
        card:
          border: '2px solid #333'

    after =
      card:
        position: 'absolute'
        background: 'grey'
        border: '2px solid #333'

    expect(css.inline.call(@, before)).to.eql(after)
