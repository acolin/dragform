class FormBuilder.Form
  constructor: (args={}) ->
    @form = new FormBuilder.Model.Form(args.registrationForm)
    @title = args.title || @_defaultTitle()
    @description = args.description || @_defaultDescription()
    @newFieldForm = new FormBuilder.FieldForm()
    @fieldList = ko.observableArray()
    @_initFieldList(args.fieldsData)
    @defaultQuestionLimit = @_initQuestionLimit(args.questionLimit)
    @filteredList = ko.computed((->
      @_computeFilteredList()
    ), @)
    @remainingQuestionLimit = ko.computed((->
      @defaultQuestionLimit - @filteredList().length
    ), @)
    @hasChanges = ko.observable(false)
    @activeForm = ko.observable(@fieldList().length)
    @subscriberComputed = ko.computed((->
      @notifyOnSubscribers('onChanges', @) if @hasChanges() is true
    ), @)
    @_subscribeToPositionChanges()
    @_initializePlaceHolderSortable()
    @_renderTemplateAndApplyBindings()
    @subscribers = []

  publish: ->
    if confirm '¿Estás seguro que quieres publicar los cambios?'
      @hasChanges(false)
      @notifyOnSubscribers('onPublish', @)

  subscribe:(event, onNewPublish) ->
    @subscribers.push {event: event, callback: onNewPublish }

  notifyOnSubscribers: (event, form) ->
    subscriber.callback(form, event) for subscriber in @subscribers when subscriber.event is event

  addQuestion: ->
    if @remainingQuestionLimit() isnt 0 and @newFieldForm.save()
      @fieldManager = FormBuilder.FieldManager.create(fieldData: ko.observable(@newFieldForm.field().dup()))
      @_assingPosition()
      @fieldList.push(@fieldManager)
      @newFieldForm.field().clear()
      @hasChanges(true)

  updateQuestion: (fieldManager) ->
    @hasChanges(true) if fieldManager.save()

  removeQuestion: (item)->
    @hasChanges(true) if item.field()._destroy(true)

  toJSON:->
    form = new FormBuilder.Serializers.Publish(fieldList: @fieldList(), form: @form)
    form.toJSON()

  isNewRecord:->
    if @form.id is undefined or @form.id is null
      @_deleteFormId()
      true

  displayForm: ->
    @activeForm(true)

  triggerHasChanges:(args) =>
    console.log("ordenado")
    @_changePosition(args)
    @hasChanges(true)

  _computeFilteredList: ->
    fieldManager for fieldManager in @fieldList() when fieldManager.destroyField() isnt true

  _subscribeToPositionChanges: ->
    ko.bindingHandlers.sortable.afterMove = @triggerHasChanges

  _initFieldList: (fieldsData=[]) ->
    @fieldList.removeAll()
    @fieldList.push(FormBuilder.FieldManager.create(fieldData: fieldData)) for fieldData in fieldsData
    @_sortFieldList()

  _sortFieldList: ->
    @fieldList.sort((field, comparableField) ->
      field.position() > comparableField.position()
    )

  _initQuestionLimit: (customQuestionLimit) ->
    customQuestionLimit || 20

  _defaultTitle: ->
    ""

  _defaultDescription: ->
    ""

  _renderTemplateAndApplyBindings: ->
    @_renderHTMLTemplate()
    @_applyBindings()

  _renderHTMLTemplate: ->
    target = document.getElementById("form-builder-container")
    target.innerHTML = @_HTMLTemplate()

  _applyBindings: ->
    ko.applyBindings(@)

  _HTMLTemplate: ->
    FormBuilder.Template.formTemplate

  _assingPosition: ->
    @fieldManager.setPosition(@_newFieldPosition())

  _newFieldPosition: ->
    fieldListArray = @fieldList()
    if fieldListArray.length is 0 then 1 else (@_lastFieldPosition() + 1)

  _lastFieldPosition: ->
    @fieldList()[@fieldList().length - 1].position()

  _deleteFormId:->
    delete @form.id

  _changePosition: (args) ->
    temporalItem = @fieldList()[args.targetIndex].field().position()
    @fieldList()[args.targetIndex].field().position(@fieldList()[args.sourceIndex].field().position())
    @fieldList()[args.sourceIndex].field().position(temporalItem)
    @_sortFieldList()

  _initializePlaceHolderSortable: ->
    ko.bindingHandlers.sortable.options =
      placeholder: 'ui-state-highlight'
      start: (e, ui) ->
        dragElements = $('.ui-state-highlight')
        dragElements.css 'height', ui.helper.outerHeight()

