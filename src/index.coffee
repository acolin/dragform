Form = require('./form')

if typeof module isnt 'undefined' and @module isnt module
  window.DragForm = Form
else
  module.exports = Form
