NODE_PATH works with browserify:

    Regular browserify (output to module.js)...
    NODE_PATH=/tmp/browserify-list-issue/assets browserify specs/a_spec.js > module.js

And module contents is:

    (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
    var a = require('a');

    console.log('a is "a": ', a === 'a');

    },{"a":2}],2:[function(require,module,exports){
    module.exports = 'a';

    },{}]},{},[1])

NODE_PATH does not work with `browserify --list`:

    browserify --list ...
    NODE_PATH=/tmp/browserify-list-issue/assets browserify --list specs/a_spec.js

    stream.js:94
          throw er; // Unhandled stream error in pipe.
                ^
    Error: Cannot find module 'a' from '/private/tmp/browserify-list-issue/specs'
        at /usr/local/share/npm/lib/node_modules/browserify/node_modules/browser-resolve/node_modules/resolve/lib/async.js:44:17
        at process (/usr/local/share/npm/lib/node_modules/browserify/node_modules/browser-resolve/node_modules/resolve/lib/async.js:110:43)
        at /usr/local/share/npm/lib/node_modules/browserify/node_modules/browser-resolve/node_modules/resolve/lib/async.js:119:21
        at load (/usr/local/share/npm/lib/node_modules/browserify/node_modules/browser-resolve/node_modules/resolve/lib/async.js:54:43)
        at /usr/local/share/npm/lib/node_modules/browserify/node_modules/browser-resolve/node_modules/resolve/lib/async.js:60:22
        at /usr/local/share/npm/lib/node_modules/browserify/node_modules/browser-resolve/node_modules/resolve/lib/async.js:16:47
        at Object.oncomplete (fs.js:107:15)
