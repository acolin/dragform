class FormBuilder.FieldForm
  constructor: (args={}) ->
    @_field = args.field || ko.observable(new FormBuilder.Model.Field())
    @field = ko.observable(@_field().dup())
    @fieldTypes = @_initFieldTypes()

  isFieldType: (type) ->
    type is @field().type()

  fieldType: ->
    @fieldTypes[@field().type()]

  fieldTypesForSelect: ->
    fieldType for key, fieldType of @fieldTypes

  save: ->
    if @field().isValid()
      @_field(@field().dup())
      true
    else
      false

  reset: ->
    @field(@_field().dup())

  _initFieldTypes: ->
    {
      text:  new FormBuilder.FieldType.TextFieldType()
      textarea: new FormBuilder.FieldType.TextAreaFieldType()
      select: new FormBuilder.FieldType.SelectFieldType(options: @field().options)
    }
