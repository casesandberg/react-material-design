


module.exports = (file) ->

  while match = /(is="(.+?)")/.exec(file)
    # The is block that should be replaced. Looks like: `is="message"`
    prop = match[1]
    # The name of the value that we want to be returning from the style function.
    element = match[2]

    # if its a custom component
    if element[0] is element[0].toUpperCase()
      file = file.replace(prop, "{...this.styles().#{ element }}")

    # otherwise just give it an inline style
    else
      file = file.replace(prop, "style={ this.styles().#{ element } }")


  return file
