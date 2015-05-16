# react-css

Inline CSS in React.

## Usage

Require it into the top of any file that you want to use it in:

    css = require('react-css')

Set `css.inline` as a css function on the root of the component

    class Avatar extends React.Component
      css: css.inline

### Defining Classes

You can think of the classes as ways of describing the component when it is in different states or contexts. You will generally define a default class which is what your component will look no matter what:

    classes: ->
      'default':
        title:
          fontSize: '28px'

        subTitle:
          fontSize: '14px'

You can then define multiple classes that can be activated later with a condition or by a parent like so:

    classes: ->
      'default':
        ...

      'compact':
        title:
          fontSize: '18px'
          fontWeight: 'bold'

        subTitle:
          letterSpacing: '-1px'

TIP: When naming classes, describe what the css is actually doing to the component instead of how it is being activated. e.g: If you want the text to get smaller on a mobile device, you would name the class 'compact' or 'compact-text' instead of 'mobile'


### Activating Classes Within the Component

After declaring classes, you have to them activate them on the component for them to show up. All you really need is a `default` class and to have the styles function call the css function:

    classes: ->
      'default':
        body:
          backgroundColor: '#fafafa'

    styles: -> @css()

The `default` class is activated automatically. To activate more classes, or to activate classes conditionally, pass an object through as the first parameter of the css function where each key is the class name you want to activate and the value returns true if it should be activated:

    styles: -> @css
      'compact': @context.device is 'mobile'


### Activating Classes on a Child Component

To activate a class on a child, simply define `class` in the css as the class name you want activated:

    classes: ->
      'default':
        avatar:
          class: 'rounded'


To activate multiple classes, just list them with a space in between. They will activate in the order you typed them:

    classes: ->
      'default':
        avatar:
          class: 'rounded large blue-border'





## Extras


### Using @props or @state inline, and how to resolve statements

This is really powerful because you can use javascript inline with the css to do some really powerful things with it. If you are going to be selectively applying html and dont want to create a new style for it, you can do it inline:

    marginTop: '-7px' if @props.prev is 'tweet'

The problem with this, however, lies on the fact that if you declare the same css property twice, the second one with overwrite the first. Howver, because this is javascript, even if the second one is undefined, it will still overwrite the first one. So we have included the `css.resolve` function to help you out. Just pass it a bunch of arguments, and it will always take the last one that isnt undefined:

    borderRadius: css.resolve '2px',
                              '0 0 2px 2px' if @props.prev is 'tweet'


### Applying styles to elements
Instead of having to reference the style function or worry about any of that, you just give the element a name via the is prop `is="name"`:

    render: ->
      <div is="header">
        <div is="logo"></div>
        <div is="links"></div>
      </div>

You should also be naming any custom components just in case you want to pass down styles to it:

    render: ->
      <div is="header">
        <div is="logo"></div>
        <div is="links">
          <Navigation is="nav" />
        </div>
      </div>

Using this method makes your html easier to read, and you also dont have to worry about the fact that you need to pass styles to html elements via `style` and custom style names to components via `styles`:

    render: ->
      <div style="@styles().header">
        <div style="@styles().logo"></div>
        <div style="@styles().links">
          <Navigation styles="@styles().nav" />
        </div>
      </div>




## License (MIT)

Copyright © 2015, **Respondly**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
