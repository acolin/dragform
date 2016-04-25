jsdom = require('jsdom')

doc = jsdom.jsdom('<!doctype html><html><body></body></html>')
win = doc.defaultView

global.document = doc
global.window = win

for own key, value of window
  global[key] = value unless key of global
