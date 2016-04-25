expect = require('chai').expect
Field = require('../../../src/form_builder/models/field')

describe "Field", ->
  describe "#new", ->
    it "creates a valid instance", ->
      field = new Field(
        helpText: ''
        position: 1
        required: true
        title: 'Are you ok?'
        type: 'text'
        id: 1
      )

      expect(field.isValid()).to.be_true

    it "creates an invalid instance", ->
      field = new Field()

      expect(field.isValid()).to.be_false
