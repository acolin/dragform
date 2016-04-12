class FormBuilder.FieldManager
  constructor: (args={}) ->
    @field = @_initField(args.fieldData)
    @editForm = new FormBuilder.FieldForm(field: @field)
    @mode = ko.observable('show')
    @hasChanges = ko.observable(false)

  @create: (args) ->
    if args instanceof Array
      new @(managerArgs) for managerArgs in args
    else
      new @(args)

  save: ->
    @show() if @editForm.save()

  cancel: =>
    @editForm.reset()
    @show()

  show: ->
    @mode('show')

  edit: ->
    @mode('edit')

  position: ->
    @field().position()

  setPosition: (newPosition) ->
    @field().position(newPosition)

  destroyField: ->
    @field()._destroy()

  _initField: (fieldData) ->
    return fieldData if typeof fieldData == 'function'
    ko.observable(new FormBuilder.Model.Field(fieldData))
