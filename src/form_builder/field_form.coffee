Field = require('./models/field')
TextFieldType = require('./field_types/text_field_type')
TextAreaFieldType = require('./field_types/text_area_field_type')
SelectFieldType = require('./field_types/select_field_type')

class FieldForm
  constructor: (args={}) ->
    @_field = args.field || ko.observable(new Field())
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
      text:  new TextFieldType()
      textarea: new TextAreaFieldType()
      select: new SelectFieldType(options: @field().options)
    }

module.exports = FieldForm
