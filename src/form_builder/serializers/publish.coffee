class Publish
  constructor:(args={})->
    @fieldList = args.fieldList
    @form      = args.form

  toJSON: ->
    JSON.stringify(@_getJSONToPublish())

  _getJSONToPublish:->
    @_merge(@_getFormJSON(), @_getFieldsJSON())

  _getFormJSON:->
    ko.mapping.toJS(@form)

  _getFieldsJSON:->
    ko.mapping.toJS(@_getItemFields())

  _merge:(registrationForm, registrationFormFields)->
    registrationForm.ticket_registration_form_fields_attributes = registrationFormFields
    registrationForm

  _getItemFields: ->
    fieldManager.field() for fieldManager in @fieldList

module.exports = Publish
