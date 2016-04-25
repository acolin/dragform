formCreator = "
<div class='add-field card-info' data-bind='visible: remainingQuestionLimit() > 0'>
  <h5 class='fieldset-title'>Add up to <strong data-bind='text: remainingQuestionLimit()'></strong> questions</h5>
  <form data-bind='with: newFieldForm.field, submit: addQuestion' id='new-form-field'>
    <ul class='form-field-container'>
    <li class='form-field grid-row'>
      <div class='col4 text-right'>
        <label>Question title</label>
      </div>
      <div class='col8'>
        <input type='text' id='new-field-title' data-bind='value: title, hasfocus: true' title='This field is required'>
      </div>
    </li>
    <li class='form-field grid-row'>
      <div class='col4 text-right'>
        <label>
          Help Text
          <span class='optional'>(optional)</span>
        </label>
      </div>
      <div class='col8'>
        <input type='text' data-bind='value: helpText'>
      </div>
    </li>
    <li class='form-field grid-row'>
      <div class='col4 text-right'>
        <label>
          Question type
          <span class='required'>*</span>
        </label>
      </div>
      <div class='col8'>
        <label class='select-wrapper'>
          <select data-bind='value: type, options: $root.newFieldForm.fieldTypesForSelect(), optionsText: \"text\", optionsValue: \"value\"'></select>
        </label>
        <!-- ko if: $root.newFieldForm.isFieldType(\"select\") -->
        <span class='validationMessage' data-bind='validationMessage: $root.newFieldForm.field().options'></span>
        <!-- /ko -->
      </div>
    </li>
    <li class='grid-row add-select'>
      <div class='push4-l col8'>
        <div data-bind='visible: $root.newFieldForm.isFieldType(\"text\")'>
          <input style='display:inline' type='text' placeholder='Your answer' readonly=''>
        </div>
        <div data-bind='visible: $root.newFieldForm.isFieldType(\"textarea\")'>
          <textarea style='display:inline' placeholder='Su párrafo' readonly=''></textarea>
        </div>
        <div data-bind='visible: $root.newFieldForm.isFieldType(\"select\")'>
          <span>Opciones:</span>
          <ul class='select-options' data-bind='foreach: $root.newFieldForm.field().options()'>
            <li>
              <input type='text' data-bind='value: value, hasfocus: true'/>
              <a class='delete' href='#' data-bind='click: function() { return $root.newFieldForm.fieldType().removeOption($data) }'>
                <span class='icon ss-standard ss-delete'></span>
              </a>
            </li>
          </ul>
          <input style='display:inline' type='text' placeholder='Click to add option' readonly='' data-bind='click: function() { return $root.newFieldForm.fieldType().addOption() }' >
        </div>
      </div>
    </li>
    <li class='form-field grid-row'>
      <div class='push4-l col8'>
        <label>
          <input style='display:inline' data-bind='checked: required, attr: {value: $root.newFieldForm.field().required}' type='checkbox' placeholder='Your answer' readonly=''>
          This question is mandatory
        </label>
      </div>
    </li>
    <li class='form-action grid-row'>
      <div class='push4-l col8'>
        <button class='button button-secondary button-default'>Add question</button>
      </div>
    </li>
  </ul>
  </form>
</div>
"
module.exports = formCreator