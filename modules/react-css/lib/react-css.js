var React, _, _css, _merge, _replace, _resolve, autoIncludedClasses, css, define, merge, replaceProps,
  slice = [].slice;

merge = require('merge');

React = require('react');

_ = require('lodash');

autoIncludedClasses = ['default'];


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
  var arrayOfStyles, condition, i, j, key, len, len1, name, obj, pushStyle, ref, ref1, ref2, value;
  arrayOfStyles = [];
  if (this.classes == null) {
    throw console.warn("Make sure you have this.classes defined on `" + this.constructor.displayName + "`");
  }
  pushStyle = (function(_this) {
    return function(name, options) {
      if (_this.classes()[name] != null) {
        return arrayOfStyles.push(_this.classes()[name]);
      } else if (name && (options != null ? options.warn : void 0) === true) {
        return console.warn("The class `" + name + "` does not exist on `" + _this.constructor.displayName + "`");
      }
    };
  })(this);
  for (i = 0, len = autoIncludedClasses.length; i < len; i++) {
    name = autoIncludedClasses[i];
    pushStyle(name);
  }
  for (name in declaredClasses) {
    condition = declaredClasses[name];
    if (condition === true) {
      pushStyle(name, {
        warn: true
      });
    }
  }
  ref1 = (ref = this.props) != null ? ref.style : void 0;
  for (key in ref1) {
    value = ref1[key];
    if (key === 'class') {
      ref2 = value.split(' ');
      for (j = 0, len1 = ref2.length; j < len1; j++) {
        name = ref2[j];
        pushStyle(name, {
          warn: true
        });
      }
    } else {
      console.warn("You shouldnt be defining CSS for children components in `" + this.constructor.displayName + "`, please pass down a class name instead.");
      arrayOfStyles.push((
        obj = {},
        obj["" + key] = value,
        obj
      ));
    }
  }
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
React mixin that handles checking of all of the components styles and applies
any styles passed down via props.styles
@param defaultValue: The default "base" value
@param possibleValues...: Unlimited number of function arguments
@returns object
 */

css.mixin = {
  css: function() {
    var activeStyleNames, arrayOfStyles, i, len, ref, ref1, ref2, ref3, ref4, ref5, ref6, styleName;
    activeStyleNames = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    arrayOfStyles = [];
    if ((this.classes != null) && activeStyleNames) {

      /*
      TESTING THIS FROM ConversationColumn.cjsx
       */
      if (this.currentBound != null) {
        activeStyleNames.push(this.currentBound());
      }
      if ((ref = this.props) != null ? (ref1 = ref.style) != null ? ref1["class"] : void 0 : void 0) {
        if (typeof ((ref2 = this.props.style) != null ? ref2["class"] : void 0) === 'string') {
          if (((ref3 = this.props.style) != null ? ref3["class"].indexOf(' ') : void 0) !== -1) {
            activeStyleNames = activeStyleNames.concat((ref4 = this.props.style) != null ? ref4["class"].split(' ') : void 0);
          } else {
            activeStyleNames.push(this.props.style["class"]);
          }
        }
      }
      for (i = 0, len = activeStyleNames.length; i < len; i++) {
        styleName = activeStyleNames[i];
        if (this.classes()[styleName]) {
          arrayOfStyles.push(this.classes()[styleName]);
        } else if (styleName) {
          console.warn("The class `" + styleName + "` does not exist on `" + this.constructor.displayName + "`");
        }
      }
      if (_.omit((ref5 = this.props) != null ? ref5.style : void 0, 'class')) {
        arrayOfStyles.push(_.omit((ref6 = this.props) != null ? ref6.style : void 0, 'class'));
      }
    } else {
      console.warn('Make sure you have classes defined under this.classes in your component');
    }
    return _css(arrayOfStyles);
  }
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
