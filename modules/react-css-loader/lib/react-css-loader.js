module.exports = function(file) {
  var element, match, prop;
  while (match = /(is="(.+?)")/.exec(file)) {
    prop = match[1];
    element = match[2];
    if (element[0] === element[0].toUpperCase()) {
      file = file.replace(prop, "{...this.styles()." + element + "}");
    } else {
      file = file.replace(prop, "style={ this.styles()." + element + " }");
    }
  }
  return file;
};
