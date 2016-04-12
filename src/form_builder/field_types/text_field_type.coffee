class FormBuilder.FieldType.TextFieldType
  constructor: (args={}) ->
    @value = args.value || @_defaultValue()
    @text = args.text || @_defaultText()

  _defaultValue: ->
    "text"

  _defaultText: ->
    "Texto"
