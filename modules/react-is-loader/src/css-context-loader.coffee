


module.exports = (file) ->

  while match = /("is": "(.+?)")/.exec(file)
    # The is block that should be replaced. Looks like: `"is": "message"`
    isPropBlock = match[1]
    # The name of the value that we want to be returning from the style function.
    isPropValue = match[2]

    file = file.replace(isPropBlock, '"style": this.styles().' + isPropValue)

  return file
