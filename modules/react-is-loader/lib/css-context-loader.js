module.exports = function(file) {
  var isPropBlock, isPropValue, match;
  while (match = /("is": "(.+?)")/.exec(file)) {
    isPropBlock = match[1];
    isPropValue = match[2];
    file = file.replace(isPropBlock, '"style": this.styles().' + isPropValue);
  }
  return file;
};
