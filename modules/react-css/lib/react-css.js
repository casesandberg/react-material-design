var React, _, _css, _merge, _replace, _resolve, css, define, merge, replaceProps,
  slice = [].slice;

merge = require('merge');

React = require('react');

_ = require('lodash');


/*
CSS in React
 */

css = function(styles) {
  return _css(styles);
};

css.merge = function(styles) {
  return _merge(styles);
};

css.replace = function(css, customFuncs) {
  return _replace(css, customFuncs);
};

css.resolve = function() {
  return _resolve.apply(this, arguments);
};


/*
Inline CSS function. This is the half-way point until multiple inheritance exists
@param declaredClasses: Object{ 'class-name': true / false }
@returns object
 */

css.inline = function(declaredClasses) {
  var arrayOfStyles, condition, i, key, len, name, prop, pushStyle, ref, ref1, ref2, ref3, value;
  arrayOfStyles = [];
  if (this.classes == null) {
    throw console.warn("Make sure you have this.classes defined on `" + this.constructor.name + "`");
  }
  pushStyle = (function(_this) {
    return function(name, options) {
      if (_this.classes()[name] != null) {
        return arrayOfStyles.push(_this.classes()[name]);
      } else if (name && (options != null ? options.warn : void 0) === true) {
        return console.warn("The class `" + name + "` does not exist on `" + _this.constructor.name + "`");
      }
    };
  })(this);
  pushStyle('default');
  ref = _.omit(this.props, 'style');
  for (prop in ref) {
    value = ref[prop];
    if (value === true) {
      pushStyle(prop);
    } else if (value) {
      pushStyle(prop + "-" + value);
    } else {
      pushStyle(prop + "-false");
    }
  }
  for (name in declaredClasses) {
    condition = declaredClasses[name];
    if (condition === true) {
      pushStyle(name, {
        warn: true
      });
    }
  }
  ref2 = (ref1 = this.props) != null ? ref1.style : void 0;
  for (key in ref2) {
    value = ref2[key];
    if (key === 'class') {
      ref3 = value.split(' ');
      for (i = 0, len = ref3.length; i < len; i++) {
        name = ref3[i];
        pushStyle(name, {
          warn: true
        });
      }
    } else {
      if (this.constructor.publicStyles != null) {
        if (!this.constructor.publicStyles[key]) {
          console.warn("`" + key + "` is not defined as a public style on `" + this.constructor.name + "`");
        }
      }
    }
  }
  pushStyle('public');
  return _css(arrayOfStyles);
};


/*
Do all the css things
@param styles: An array of style objects
@returns object
 */

_css = function(styles) {
  var merged;
  merged = _merge(styles);
  return _replace(merged);
};


/*
Step through a style object and replace any custom properties as defined
@param styleObject: An object of styles
@returns object
 */

_replace = function(styleObject, customFuncs) {
  var customProps, key, newKey, newValue, ref, replaced, value;
  customProps = customProps || customFuncs || replaceProps || {};
  replaced = {};
  for (key in styleObject) {
    value = styleObject[key];
    if (typeof value === 'object' && !Array.isArray(value)) {
      replaced[key] = _replace(value, customFuncs);
    } else {
      if (customProps[key] != null) {
        ref = customProps[key](value);
        for (newKey in ref) {
          newValue = ref[newKey];
          replaced[newKey] = newValue;
        }
      } else {
        replaced[key] = value;
      }
    }
  }
  return replaced;
};


/*
Merges an array of objects together
@param thingsToBeMerged: An array of things to be merged
@returns object
 */

_merge = function(thingsToBeMerged) {
  if (typeof thingsToBeMerged === 'object' && !Array.isArray(thingsToBeMerged)) {
    return thingsToBeMerged;
  }
  if (thingsToBeMerged.length === 1) {
    return thingsToBeMerged[0];
  }
  return merge.recursive.apply(this, thingsToBeMerged);
};


/*
Look through any number of arguments and always returns the last one defined.
@param defaultValue: The default "base" value
@param possibleValues...: Unlimited number of function arguments
@returns object
 */

_resolve = function() {
  var defaultValue, i, len, possibleValue, possibleValues, valueToReturn;
  defaultValue = arguments[0], possibleValues = 2 <= arguments.length ? slice.call(arguments, 1) : [];
  valueToReturn = defaultValue;
  for (i = 0, len = possibleValues.length; i < len; i++) {
    possibleValue = possibleValues[i];
    if (possibleValue) {
      valueToReturn = possibleValue;
    }
  }
  return valueToReturn;
};


/*
Custom Props for the _replace function
These custom props will eventually live in a file or config somewhere
 */

replaceProps = {
  borderRadius: function(value) {
    return {
      msBorderRadius: value,
      MozBorderRadius: value,
      OBorderRadius: value,
      WebkitBorderRadius: value,
      borderRadius: value
    };
  },
  boxShadow: function(value) {
    return {
      msBoxShadow: value,
      MozBoxShadow: value,
      OBoxShadow: value,
      WebkitBoxShadow: value,
      boxShadow: value
    };
  },
  transition: function(value) {
    return {
      msTransition: value,
      MozTransition: value,
      OTransition: value,
      WebkitTransition: value,
      transition: value
    };
  },
  Absolute: function(value) {
    var direction;
    direction = value.split(" ");
    return {
      position: 'absolute',
      top: direction[0],
      right: direction[1],
      bottom: direction[2],
      left: direction[3]
    };
  }
};

module.exports = css;

define = function() {};
