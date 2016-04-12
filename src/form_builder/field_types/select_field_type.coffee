class FormBuilder.FieldType.SelectFieldType
  constructor: (args={}) ->
    @text = args.text || @_defaultText()
    @value = args.value || @_defaultValue()
    @options = args.options

  addOption: ->
    @options.push(new FormBuilder.Model.FieldSelectOption())

  removeOption: (option) ->
    @options.remove(option)

  _defaultValue: ->
    "select"

  _defaultText: ->
    "Selecciona de una lista"
