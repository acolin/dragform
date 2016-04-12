class FormBuilder.Model.Field
  constructor: (args={}) ->
    @helpText = ko.observable(args.helpText)
    @position = ko.observable(args.position)
    @required = ko.observable(args.required)
    @options  = ko.observableArray(@_mapOptions(args.options))
    @title    = ko.observable(args.title)
    @type     = ko.observable(args.type)
    @id       = ko.observable(args.id)
    @_destroy = ko.observable(false)
    @_setValidations()
    @_setOptionsValidations()

  isValid: ->
    @_notifySubscribers()
    @title.isValid() && @type.isValid() && @_optionsAreValid()

  dup: ->
    dup = ko.mapping.fromJS(ko.mapping.toJS(@), {}, new FormBuilder.Model.Field)
    dup._setValidations()
    dup

  clear: ->
    @title('')
    @options([])
    @required(false)
    @helpText('')
    @type('text')
    @title.isModified(false)

  isType: (type) ->
    @type() is type

  _optionsAreValid: ->
    valid = true

    return valid unless @isType('select')
    return not(valid) unless @options.isValid()
    for option in @options()
      valid = false unless option.isValid()

    valid

  _setValidations: ->
    @title.extend({required:  message: 'El titulo de la pregunta es obligatorio'})
    @type.extend({required: message: 'Selecciona el tipo de pregunta'})
    @_setOptionsValidations()

  _setOptionsValidations: ->
    @options.extend(minLength: { params: 1, message: "Agrega al menos 1 opción" })
    @options.isModified(false)

    option.value.extend({ required: message: 'Este campo es obligatorio'} ) for option in @options()

  _notifySubscribers: ->
    @title.notifySubscribers()
    @type.notifySubscribers()
    @_notifyOptionsSubscribers()

  _notifyOptionsSubscribers: ->
    @options.notifySubscribers() if @isType('select')

  _mapOptions: (options=[]) ->
    FormBuilder.Model.FieldSelectOption.create(options)
