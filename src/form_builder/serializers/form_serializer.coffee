ko = require('knockout')
koMapping = require('knockout-mapping')

class FormSerializer
  constructor:(args={})->
    @fieldList = args.fieldList
    @form = args.form

  toJSON: ->
    JSON.stringify(@_getObjectToPublish())

  _getObjectToPublish:->
    formJS = ko.mapping.toJS(@form)
    fieldsJS = ko.mapping.toJS(@_getFields())
    formJS.fields = fieldsJS

    formJS

  _getFields: ->
    fieldManager.field() for fieldManager in @fieldList

module.exports = FormSerializer
