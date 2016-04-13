class TextAreaFieldType
  constructor: (args={}) ->
    @value = args.value || @_defaultValue()
    @text = args.text || @_defaultText()

  _defaultValue: ->
    "textarea"

  _defaultText: ->
    "A paragraph"

module.exports = TextAreaFieldType
